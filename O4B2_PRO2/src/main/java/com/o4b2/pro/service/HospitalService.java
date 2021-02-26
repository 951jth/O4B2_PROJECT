package com.o4b2.pro.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dao.HospitalDao;
import com.o4b2.pro.dao.MedicalDao;
import com.o4b2.pro.dto.DScheduleDto;
import com.o4b2.pro.dto.DoctorDto;
import com.o4b2.pro.dto.HospitalDto;
import com.o4b2.pro.dto.LocationDto;

import lombok.extern.java.Log;



@Log
@Service
public class HospitalService {
	@Autowired
	private HospitalDao hDao;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;
	
	@Autowired
	private MedicalDao meDao;
	
	/*
	@Autowired
	private LocationDto lDto;
	 */
	@Transactional
	public String hospitalInsert(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		log.info("hospitalInsert()");
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String encPwd = pwdEncoder.encode(multi.getParameter("h_pwd"));

		String view = null;

		String id = multi.getParameter("h_id");
		String repre = multi.getParameter("h_repre");
		String name = multi.getParameter("h_name");
		//진료과목 저장변수
		String im = multi.getParameter("h_im");
		String ent = multi.getParameter("h_ent");
		String os = multi.getParameter("h_os");
		String ps = multi.getParameter("h_ps");
		String dm = multi.getParameter("h_dm");
		String call = multi.getParameter("h_call");
		
		String cn = multi.getParameter("h_cn");
		int crn = 1;
		int pcn = Integer.parseInt(cn);

		String ra = multi.getParameter("RA");
		String ja = multi.getParameter("JA");
		String da = multi.getParameter("DA");
		String pc = multi.getParameter("PC");

		String hCheck = multi.getParameter("filecheck1");

		HospitalDto hos = new HospitalDto();

		hos.setH_id(id);
		hos.setH_pwd(encPwd);
		hos.setH_repre(repre);
		hos.setH_name(name);
		hos.setH_crn(crn);
		hos.setH_addr(ra + "/" + ja + "/" + da + "/" + pc);
		hos.setH_cn(pcn);
		hos.setH_major(im + "/" + ent + "/" + os + "/" + ps + "/" + dm);
		hos.setH_call(call);
		
		try {
			hDao.HospitalInsert(hos);

			if(hCheck.equals("1")) {
				fileUp(multi, hos.getH_id());
				log.info("체크값:" + hCheck);
				rttr.addFlashAttribute("msg", "회원가입 성공");
				session.setAttribute("hb", hos);
				view="redirect:hMain";
			}
		}catch (Exception e) {
			// TODO: handle exception
			log.info(hCheck);
			view="redirect:joinFrm";
			rttr.addFlashAttribute("msg", "회원가입 실패");
		}

		return view;
	}

	private boolean fileUp(MultipartHttpServletRequest multi, String h_id)
			throws Exception{

		String path = multi.getSession().getServletContext().getRealPath("/");
		path += "resources/upload/";
		log.info(path);

		File dir = new File(path);

		if(dir.isDirectory() == false) {
			dir.mkdir();//폴더가 없을경우 생성
		}

		Map<String, String> fmap = new HashMap<String, String>();

		//파일태그가 여러개인 경우
		Iterator<String> files = multi.getFileNames();
		int cc = 0;
		while(cc <= 1) {
			if(cc == 0) {
				List<MultipartFile> fList1 = multi.getFiles("h_image");

				for(int i = 0; i < fList1.size(); i++) {
					MultipartFile mf = fList1.get(i);
					String on = mf.getOriginalFilename();

					String sn = System.currentTimeMillis()
							+ "."
							+ on.substring(on.lastIndexOf(".") + 1);
					//.이전의 문자열 제거
					log.info("파일값: " + sn);
					fmap.put("h_image" , sn);
					mf.transferTo(new File(path + sn));
					fmap.put("h_id", h_id);

				}
				hDao.fileInsert(fmap);
				cc++;
			}
			else {
				List<MultipartFile> fList2 = multi.getFiles("h_reg");
				System.out.println("값" + fList2);
				for(int i = 0; i < fList2.size(); i++) {
					MultipartFile mf = fList2.get(i);
					String on = mf.getOriginalFilename();

					String sn2 = System.currentTimeMillis()
							+ "."
							+ on.substring(on.lastIndexOf(".") + 1);
					//. 문자이전의 문자열 제거
					//date.파일이름의 형태로 저장
					log.info("파일값: " + sn2);
					fmap.put("h_reg" , sn2);
					mf.transferTo(new File(path + sn2));
					fmap.put("h_id", h_id);
					System.out.println("값 :" + sn2);
				}			
				hDao.regInsert(fmap);
				cc++;
			}
		}
		return true;
	}

	public String inputDoctor(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		
		String view = null;
		String d_name = multi.getParameter("d_name");
		String im = multi.getParameter("h_im");
		String ent = multi.getParameter("h_ent");
		String os = multi.getParameter("h_os");
		String ps = multi.getParameter("h_ps");
		String dm = multi.getParameter("h_dm");
		String com = multi.getParameter("d_com");

		DoctorDto doctor = new DoctorDto();
		String check = multi.getParameter("filecheck");
		HospitalDto hospital = (HospitalDto)session.getAttribute("hb");
		String h_id = hospital.getH_id();
		doctor.setH_id(h_id);
		doctor.setD_name(d_name);
		doctor.setD_major(im + "/" + os + "/" + ps + "/" + dm + "/"+ ent);
		doctor.setD_comment(com);
		log.info(check);

		try {
			hDao.insertDoctor(doctor);		
			if(check.equals("1")) {
				doctorUp(multi, doctor.getD_num());
			}
			rttr.addFlashAttribute("msg", "등록성공");
			view = "redirect:hMain";
		} catch (Exception e) {
			// TODO: handle exception
			rttr.addFlashAttribute("msg", "등록실패");
			view = "redirect:doctorInput";
		}
		return view;
	}
	public boolean doctorUp(MultipartHttpServletRequest multi, int d_num) 
		throws Exception{
		// TODO Auto-generated method stub
		List<MultipartFile> doctor = multi.getFiles("d_image");
		log.info("이미지 :" + doctor);
		String path = multi.getSession().getServletContext().getRealPath("/");
		path += "resources/upload/";
		
		log.info(path);

		File dir = new File(path);
		
		if(dir.isDirectory() == false) {
			dir.mkdir();//폴더가 없을경우 생성
		}
		Map<String, String> dmap = new HashMap<String, String>();
		for(int i = 0; i < doctor.size(); i++) {
			MultipartFile df = doctor.get(i);
			String on = df.getOriginalFilename();
			//변경된 파일 이름 저장
			String sn = System.currentTimeMillis()
					+ "." //확장자 구분 점
					+ on.substring(on.lastIndexOf(".") + 1);
			dmap.put("d_dimage", sn);
			//해당 폴더에 파일 저장하기
			df.transferTo(new File(path + sn));
				
		}
		dmap.put("d_num", String.valueOf(d_num));
		hDao.doctorImgInsert(dmap);
		return true;
	}
	
	public ModelAndView getSearch(String hos, int check){
		List<HospitalDto> hDto = null;

		mv = new ModelAndView();
		if(check == 1) {
			hDto = hDao.getHospital(hos);
			if(hDto.size() != 0) {
				mv.addObject("hos", hDto);
			}
			else {
				String noData = "noData";

				log.info(noData);
				mv.addObject("noData",noData);
			}
		}
		else if(check == 2) {
			hDto = hDao.getHosMajor(hos);
			if(hDto.size() != 0) {
				mv.addObject("hos", hDto);
			}
			else {
				String noData = "noData";

				log.info(noData);
				mv.addObject("noData",noData);
			}
		}


		mv.setViewName("searchH");
		return mv;
	}
	
	@Transactional
	public String HospitalUpdate(MultipartHttpServletRequest multi, 
			RedirectAttributes rttr) {
		log.info("HospitalUpdate");

		String view = null;
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();
		HospitalDto hospital = new HospitalDto();	
		
		
		String pwd = multi.getParameter("h_pwd");
		String id = multi.getParameter("h_id");
		String repre = multi.getParameter("h_repre");	
		String cn = multi.getParameter("h_cn");
		
		hospital.setH_pwd(pwd); 
		hospital.setH_id(id); 
		hospital.setH_repre(repre);
		hospital.setH_cn(Integer.parseInt(cn));
		
		log.info("값:" + hospital);
		
		try {
			hDao.HospitalUpdate(hospital);
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "수정 성공");
		} catch (Exception e) {
			view = "redirect:hosInfo";
			rttr.addFlashAttribute("msg", "수정 실패");
		}
		return view;
		
	}
	
	public ModelAndView getHosInfo(String hId) {
		HospitalDto hDto = new HospitalDto();
		log.info(hId);
		mv = new ModelAndView();
		
		hDto = hDao.getHospitalInfo(hId);
		List<DoctorDto> dList = hDao.getDoctor(hId);
		mv.addObject("dList", dList);
		mv.addObject("hos", hDto);
		mv.setViewName("hinfo");
		return mv;
	}
	@Transactional
	   public String HosSearchId(Integer h_cn, RedirectAttributes rttr) {
	      
	      log.info("service_HosSearchId() : " + h_cn);
	      
	      String id = hDao.HosSearchId(h_cn);
	      String view;
	      
	      log.info("id : " + id);
	      
	      if(id != null || id != "") {
	         
	         view = "redirect:loginFrm";
	         rttr.addFlashAttribute("msg","찾으시는 아이디는 " + id + " 입니다.");
	      }
	      else {
	         
	         view = "redirect:loginFrm";
	         rttr.addFlashAttribute("msg", "검색된 아이디가 없습니다.");
	      }
	      
	      return view;
	      
	   }
	
	@Transactional
	   public String HosSearchPwd(String h_id, RedirectAttributes rttr) {
	      
	      log.info("service_HosSearchPwd() : " + h_id);
	      
	      String pwd = hDao.HosSearchPwd(h_id);
	      String view;
	      
	      log.info("pwd : " + pwd);
	      
	      if(pwd != null || pwd != "") {
	         
	         view = "redirect:loginFrm";
	         rttr.addFlashAttribute("msg","찾으시는 비밀번호는 " + pwd + " 입니다.");
	      }
	      else {
	         
	         view = "redirect:loginFrm";
	         rttr.addFlashAttribute("msg", "검색된 비밀번호가 없습니다.");
	      }
	      
	      return view;
	      
	   }
	
	public ModelAndView getDocCal(String hId) {
		log.info(hId);
		mv = new ModelAndView();

		List<Integer> dNum = meDao.getD_num(hId);
		List<String> dName = new ArrayList<String>();

		for(int a : dNum) {
			dName.add(meDao.getDocName2(a));
		}

		mv.addObject("dName",dName);
		mv.setViewName("docCalendar");
		return mv;
	}


	@Transactional
	public Map<String, List<String>> docCalSel(Map<String, Object> sche) {
		log.info((String)sche.get("d_name"));
		log.info((String)sche.get("h_id"));
		
		Map<String, List<String>> rMap = new HashMap<String, List<String>>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		List<DScheduleDto> dsDto = null;
		List<String> mName1 = new ArrayList<String>();
		List<String> mName2 = new ArrayList<String>();
		List<String> mName3 = new ArrayList<String>();
		List<String> mName4 = new ArrayList<String>();
		List<String> mName5 = new ArrayList<String>();
		List<String> mName6 = new ArrayList<String>();
		List<String> mName7 = new ArrayList<String>();
		List<String> mName8 = new ArrayList<String>();
		
		int d_num = hDao.getDnum((String)sche.get("d_name"), (String)sche.get("h_id"));

		dsDto = hDao.getSchedule(d_num);
		for(DScheduleDto ds : dsDto) {
			if(((String)sche.get("date")).equals(ds.getDc_date())) {
				switch (ds.getDc_time()) {
				case 1:
					mName1.add(hDao.getMname(hDao.getMid(ds.getMe_num())));
					break;
				case 2:
					mName2.add(hDao.getMname(hDao.getMid(ds.getMe_num())));
					break;
				case 3:
					mName3.add(hDao.getMname(hDao.getMid(ds.getMe_num())));
					break;
				case 4:
					mName4.add(hDao.getMname(hDao.getMid(ds.getMe_num())));
					break;
				case 5:
					mName5.add(hDao.getMname(hDao.getMid(ds.getMe_num())));
					break;
				case 6:
					mName6.add(hDao.getMname(hDao.getMid(ds.getMe_num())));
					break;
				case 7:
					mName7.add(hDao.getMname(hDao.getMid(ds.getMe_num())));
					break;
				case 8:
					mName8.add(hDao.getMname(hDao.getMid(ds.getMe_num())));
					break;
				}
			}
		}
		rMap.put("docCal9", mName1);
		rMap.put("docCal10", mName2);
		rMap.put("docCal11", mName3);
		rMap.put("docCal13", mName4);
		rMap.put("docCal14", mName5);
		rMap.put("docCal15", mName6);
		rMap.put("docCal16", mName7);
		rMap.put("docCal17", mName8);
		return rMap;
	}

	public String deleteDoctor(int d_num, RedirectAttributes rttr) {
		String view=null;
		HospitalDto hb = (HospitalDto)session.getAttribute("hb");
		String h_id = hb.getH_id();
		try {	
			hDao.deleteDoctor(d_num);
			rttr.addFlashAttribute("msg","삭제성공");
			view = "redirect:hinfo?hId=" + h_id;
			
		} catch (Exception e) {
			// TODO: handle exception
			rttr.addFlashAttribute("msg","삭제실패");
			view = "redirect:hinfo?hId=" + h_id;
		}
		
		return view;
	}

}
