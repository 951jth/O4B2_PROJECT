package com.o4b2.pro;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dto.NoticeDto;
import com.o4b2.pro.service.AdminService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private AdminService aServ;
	
	private ModelAndView mv;
	
	
	@GetMapping("admin")
	public String admin() {
		logger.info("admin");
		
		return "admin";
	}
	
	@GetMapping("banner")
	public String banner() {
		logger.info("banner");
		
		return "banner";
	}
	
	
	@GetMapping("noticeWrite")
	public String noticeWrite() {
		logger.info("noticeList");
		
		return "noticeWrite";
	}
	
	@PostMapping("nWriteProc")
	public ModelAndView nWriteProc(MultipartHttpServletRequest mf,
			RedirectAttributes rttr) {
		logger.info("nWriteProc");
		mv = aServ.insertNt(mf,rttr);
		
		return mv;			
	}
	
	@GetMapping("noticeView")
	public ModelAndView noticeView(int n_num) {
		logger.info("noticeView");
		mv = aServ.noticeView(n_num);
		
		return mv;
	}
	
	@GetMapping("nDownload")
	public String nDownload(int n_num, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("nDownload" +  n_num);
		
		aServ.nFileDown(n_num, request, response);
		return null;
	}
	@GetMapping("updateNotice")
	public ModelAndView updateNotice() {
		
		mv.setViewName("noticeUpdate");
		return mv;
	}
	
	@PostMapping("nUpdateProc")
	public ModelAndView nUpdateProc(MultipartHttpServletRequest ms,
			RedirectAttributes rttr){
		mv = new ModelAndView();
		mv = aServ.nUpdate(ms,rttr);
		
		return mv;
	}
	
	@GetMapping("deleteNotice")
	public String deleteNotice(int n_num, RedirectAttributes rttr) {
		String view = aServ.deleteN(n_num,rttr);
		return view;
	}

}

