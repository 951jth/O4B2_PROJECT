package com.o4b2.pro.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.MBeanAttributeInfo;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dao.PreDao;
import com.o4b2.pro.dto.HospitalDto;
import com.o4b2.pro.dto.MedicalDto;
import com.o4b2.pro.dto.MemberDto;
import com.o4b2.pro.dto.PrescriptionDto;
import com.o4b2.pro.util.pPaging;

import lombok.extern.java.Log;

@Log
@Service
public class PreService {
	@Autowired
	private PreDao pDao;
	
	@Autowired
	private PreService pServ;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;
	
	public ModelAndView prePage(int me_num) {
		log.info("넘버값" + me_num);
		mv = new ModelAndView();
		//String view= "preInput?me_num="+me_num;
		MedicalDto medi = new MedicalDto();
		medi = pDao.selectMInfo(me_num);
		
		PrescriptionDto pDto = new PrescriptionDto();
		pDto.setH_id(medi.getH_id());
		pDto.setM_id(medi.getM_id());
		pDto.setD_num(medi.getD_num());
		pDto.setMe_num(me_num);
		pDto.setP_hname(medi.getMe_name());
		pDto.setP_major(medi.getMe_major());
		pDto.setP_dname(medi.getMe_dname());
		//mv.addObject("dname", dname);
		mv.addObject("pDto", pDto);
		mv.setViewName("preInput");
		
		return mv;
	}

	public String insertPre(MultipartHttpServletRequest ms,RedirectAttributes rttr) {
		// TODO Auto-generated method stub
		//mv = new ModelAndView();
		String view = null;
		String p_hname = ms.getParameter("p_hname");
		String p_major = ms.getParameter("p_major");
		String p_dname = ms.getParameter("p_dname");
		String h_id = ms.getParameter("h_id");
		String m_id = ms.getParameter("m_id");
		String check = ms.getParameter("filecheck");
		String num = ms.getParameter("d_num");
		String m_num = ms.getParameter("me_num");
		String p_comment = ms.getParameter("p_comment");
		String p_date = ms.getParameter("p_date");
		int filecheck = Integer.parseInt(check);
		int d_num = Integer.parseInt(num);
		int me_num = Integer.parseInt(m_num);
		PrescriptionDto pre = new PrescriptionDto();
		
		pre.setP_hname(p_hname);
		pre.setP_major(p_major);
		pre.setP_dname(p_dname);
		pre.setH_id(h_id);
		pre.setM_id(m_id);
		pre.setD_num(d_num);
		pre.setMe_num(me_num);
		pre.setP_comment(p_comment);
		pre.setP_date(p_date);
		try {
			pDao.insertPre(pre);
			if(filecheck == 1) {
				fileUp(ms,pre.getP_num());
			}
			view="close";
			rttr.addAttribute("msg", "등록성공");
		} catch (Exception e) {
			// TODO: handle exception
			view="preInput";
			rttr.addAttribute("msg", "등록실패");
		}
		return view;
	}

	public boolean fileUp(MultipartHttpServletRequest ms, int p_num)
		throws Exception{
		String path = ms.getSession().getServletContext()
				.getRealPath("/");
		
		path += "resources/upload/";
		log.info(path);
		
		File dir = new File(path);
		
		if(dir.isDirectory() == false) {
			dir.mkdir();
		}
		
		Map<String, String> fmap =
				new HashMap<String, String>();
		
		List<MultipartFile> fList = ms.getFiles("p_image");
		for(int i = 0; i < fList.size(); i++) {
			MultipartFile mf = fList.get(i);
			String on = mf.getOriginalFilename();
			String sn = System.currentTimeMillis()
					+ "."
					+ on.substring(on.lastIndexOf(".") + 1);
			fmap.put("p_image",sn);
			
			mf.transferTo(new File(path + sn));
		}	
		fmap.put("p_num", String.valueOf(p_num));
		pDao.fileInsert(fmap);
		return true;
	}

	public ModelAndView getPreList(int check,Integer pageNum) {
		log.info("페이지값: " + pageNum);
		mv = new ModelAndView();
		List pList = new ArrayList();
		int num = (pageNum == null) ? 1 : pageNum;
		
		int maxNum = pDao.getPreCnt();
		PrescriptionDto pre = new PrescriptionDto();
		if(check == 1) {
			MemberDto member = (MemberDto)session.getAttribute("mb");
			String m_id = member.getM_id();
			try {
				int snum = (num*4-4);
				int	lnum = num*4;
				int cnum = (maxNum < lnum)?  maxNum : lnum; 
				List<PrescriptionDto> List = pDao.selectPInfo(m_id);
				for(int a = snum; a < cnum; a++) {
					pList.add(List.get(a));
				}
				mv.addObject("pList",pList);
				mv.addObject("pPaging", getPaging(num,2,1));
				mv.setViewName("prescription");
			} catch (Exception e) {
				mv.setViewName("./");
			}
		}
		else {
			HospitalDto hos = (HospitalDto)session.getAttribute("hb");
			String h_id = hos.getH_id();
			try {
				int snum = num*4-4;
				int	lnum = num*4;
				int cnum = (maxNum < lnum)?  maxNum : lnum; 
				List<PrescriptionDto> List = pDao.selectPHos(h_id);
				for(int a = snum; a < cnum; a++) {		
					pList.add(List.get(a));	
				}
				mv.addObject("pList",pList);
				mv.addObject("pPaging", getPaging(num,2,2));
				mv.setViewName("prescription");
			} catch (Exception e) {
				// TODO: handle exception
				mv.setViewName("hMain");
				
			}
		}
		return mv;
	}

	public Object getPaging(int num, int check, int hoscheck) {
		int maxNum = 0;
		if(check == 1) {
			maxNum = pDao.getPreCnt();
		}
		else if(check ==2) {
			maxNum = pDao.getPreCnt();
		}
		
		int listCnt = 4;
		int pageCnt = 10;
		String listName = "list";
		
		pPaging pPaging = new pPaging(maxNum, num, listCnt, pageCnt
				,listName);
		String pagingHtml = pPaging.makePaging(hoscheck);
		
		return pagingHtml;
	}

	public Map<String, String> pView(int p_num) {
		PrescriptionDto pDto = pDao.preSelect(p_num);
		
		Map<String,String> pmap = new HashMap<String, String>();
		pmap.put("p_hname", pDto.getP_hname());
		pmap.put("p_dname", pDto.getP_dname());
		pmap.put("p_major", pDto.getP_major());
		pmap.put("h_id", pDto.getH_id());
		pmap.put("m_id", pDto.getM_id());
		//pmap.put("me_num", me_num);
		pmap.put("p_image", pDto.getP_image());
		pmap.put("p_comment", pDto.getP_comment());
		
		return pmap;
	}

	public String deletePre(int p_num,RedirectAttributes rttr) {
		String view=null;
		try {
			pDao.deletePre(p_num);
			view="redirect:prescription?check=2";
			rttr.addFlashAttribute("msg","삭제성공");
		} catch (Exception e) {
			// TODO: handle exception
			view="redirect:prescription";
			rttr.addFlashAttribute("msg","삭제실패");		
		}
		
		return view;
	}
		
}
