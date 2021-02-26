package com.o4b2.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dao.MedicalDao;
import com.o4b2.pro.dto.DScheduleDto;
import com.o4b2.pro.dto.HospitalDto;
import com.o4b2.pro.dto.MedicalDto;
import com.o4b2.pro.dto.MemberDto;

import lombok.extern.java.Log;

@Service
@Log
public class MedicalService {
	@Autowired
	private MedicalDao meDao;

	private ModelAndView mv;

	@Autowired
	private HttpSession session;


	//예약 등록 서비스 메소드
	 @Transactional
	   public String reseIn(MultipartHttpServletRequest multi,
	            RedirectAttributes rttr) {
	        log.info("reseIn()");

	        String view = null;

	        String hosName = multi.getParameter("hosName");
	        String hosId = multi.getParameter("hId");
	        String date = multi.getParameter("date");
	        String major = multi.getParameter("major");
	        //String docName = multi.getParameter("docName");
	        String userId = multi.getParameter("userId");
	        String phone = multi.getParameter("phone");
	        String textarea = multi.getParameter("textarea");
	        String dnum = multi.getParameter("d_num");
	        String time = multi.getParameter("me_time");
	        
	        int me_time = Integer.parseInt(time);
	        int d_num = Integer.parseInt(dnum);
	        String dName = meDao.getDName(d_num);
	        
	        Map<String, String> docNumSel = 
	                new HashMap<String, String>();
	        
	        docNumSel.put("h_id", hosId);
	        docNumSel.put("d_name", dName);

	        /*int docNum = meDao.getDocId(docNumSel);*/
	        //textarea는 입력한 문자열 앞뒤로 공백이 발생.
	        //문자열 앞뒤 공백 제거. trim()
	        textarea = textarea.trim();

	        MedicalDto board = new MedicalDto();
	        board.setMe_name(hosName);
	        board.setH_id(hosId);
	        board.setM_date(date);
	        board.setMe_major(major);
	        board.setMe_time(me_time);
	        //board.setMe_dname(docName);
	        board.setD_name(dName);
	        board.setM_id(userId);
	        board.setM_phone(phone);
	        board.setMe_text(textarea);
	        board.setD_num(d_num);
	        board.setMe_num(meDao.getMeSeq());
	        try {
	            boolean bool = meDao.medIn(board);
	            if(bool == true) {
	            	DScheduleDto ds = new DScheduleDto();
	            	ds.setDc_date(date);
	            	ds.setD_num(d_num);
	            	ds.setMe_num(board.getMe_num());
	            	ds.setDc_num(meDao.getDsSeq());
	            	ds.setDc_time(board.getMe_time());
	            	meDao.setSchedule(ds);
	            }
	            
	            rttr.addFlashAttribute("msg", "예약 성공");
	            view = "redirect:/";
	        }catch(Exception e) {
	            //e.printStackTrace();
	            view = "redirect:rese?hId="+hosId;
	            rttr.addFlashAttribute("msg", "예약 실패");
	        }

	        return view;
	    }

	public ModelAndView getHosName(int check) {
		mv = new ModelAndView();
		if(check == 1) {
			MemberDto member = (MemberDto) session.getAttribute("mb");
			String mId = member.getM_id();
			
			List<MedicalDto> completeMedi = meDao.getComMedi(mId);
			List<String> completeHos = null;
			List<String> completeDoc = null;
			
			List<MedicalDto> reseMedi = meDao.getMedi(mId);
			List<String> reseHos = null;
			List<String> reseDoc = null;
			
			for (MedicalDto medicalDto : completeMedi) {
				completeHos = meDao.getHosName(medicalDto.getH_id());
				completeDoc = meDao.getDocName(medicalDto.getD_num());
			}
			for (MedicalDto medicalDto : reseMedi) {
				reseHos = meDao.getHosName(medicalDto.getH_id());
				reseDoc = meDao.getDocName(medicalDto.getD_num());
			}
			
			//DB에서 조회한 데이터 목록을 모델에 추가
			mv.addObject("completeMedi", completeMedi);
			mv.addObject("completeHos", completeHos);
			mv.addObject("completeDoc", completeDoc);
			mv.addObject("reseMedi", reseMedi);
			mv.addObject("reseHos", reseHos);
			mv.addObject("reseDoc", reseDoc);
			
			mv.setViewName("urecheck");
		}
		if(check == 2) {
			HospitalDto hos = (HospitalDto)session.getAttribute("hb");
			String hId = hos.getH_id();
			
			List<MedicalDto> completeMedi = meDao.hgetComMedi(hId);
			List<String> completeHos = null;
			List<String> completeDoc = null;
			
			List<MedicalDto> reseMedi = meDao.hgetMedi(hId);
			List<String> reseHos = null;
			List<String> reseDoc = null;
			
			for (MedicalDto medicalDto : completeMedi) {
				completeHos = meDao.getHosName(medicalDto.getH_id());
				completeDoc = meDao.getDocName(medicalDto.getD_num());
			}
			for (MedicalDto medicalDto : reseMedi) {
				reseHos = meDao.getHosName(medicalDto.getH_id());
				reseDoc = meDao.getDocName(medicalDto.getD_num());
			}
			
			//DB에서 조회한 데이터 목록을 모델에 추가
			mv.addObject("completeMedi", completeMedi);
			mv.addObject("completeHos", completeHos);
			mv.addObject("completeDoc", completeDoc);
			mv.addObject("reseMedi", reseMedi);
			mv.addObject("reseHos", reseHos);
			mv.addObject("reseDoc", reseDoc);
			
			mv.setViewName("urecheck");
		}
		
		return mv;
	}
	public ModelAndView getHosDoc(String hId) {
        mv = new ModelAndView();
       

        String h_name = (meDao.getHosName(hId)).get(0);

        //진료과목 저장변수
        String h_major = meDao.getMajor(hId);
        boolean im = h_major.contains("IM");
        boolean ent = h_major.contains("ENT");
        boolean os = h_major.contains("OS");
        boolean ps = h_major.contains("PS");
        boolean dm = h_major.contains("DM");
        
       
        List<MedicalDto> docList = meDao.getDList(hId);
        
    
        mv.addObject("h_id",hId);
        mv.addObject("h_name",h_name);
        mv.addObject("im",im);
        mv.addObject("ent",ent);
        mv.addObject("os",os);
        mv.addObject("ps",ps);
        mv.addObject("dm",dm);
        mv.addObject("docList",docList);
        mv.addObject("h_name");
        mv.setViewName("rese");
        return mv;
    }

	public ModelAndView urecancel(int me_num) {
		mv.addObject("me_num", me_num);
		mv.setViewName("urecancel");
		return mv;
	}
	
	public String resecancelProc(int me_num, RedirectAttributes rttr) {
			log.info("me_num:" + me_num);
		try {
			meDao.deleteMedi(me_num);
			rttr.addFlashAttribute("msg", "삭제성공");
		} catch (Exception e) {
			// TODO: handle exception
			rttr.addFlashAttribute("msg", "삭제실패");
		}
		
		return  "redirect:urecheck?check=1";
	}

	public String resePermit(int me_num, RedirectAttributes rttr) {
		try {
			meDao.rPermit(me_num);
			rttr.addFlashAttribute("msg","승인성공");;
		} catch (Exception e) {
			// TODO: handle exception
			rttr.addFlashAttribute("msg", "승인실패");
		} 

		return "redirect:urecheck?check=2";
	}

	public String refuse(MedicalDto medi, RedirectAttributes rttr) {
		try {
			meDao.refuseProc(medi);
			rttr.addFlashAttribute("msg", "거부완료");
		} catch (Exception e) {
			// TODO: handle exception
			rttr.addFlashAttribute("msg", "거부실패");
		}
		
		return "redirect:urecheck?check=2";
	}
	


	
	
}
