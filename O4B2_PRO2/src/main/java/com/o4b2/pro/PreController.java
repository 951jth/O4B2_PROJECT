package com.o4b2.pro;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dto.PrescriptionDto;
import com.o4b2.pro.service.PreService;

import lombok.extern.java.Log;

@Log
@Controller
public class PreController {
	private static final Logger logger = LoggerFactory.getLogger(PreController.class);
	@Autowired
	private PreService pServ;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;
	
	@GetMapping("preInput")
	public ModelAndView preInput(int me_num) {
		log.info("넘버값: " + me_num);
		log.info("preInput");
		
		mv = pServ.prePage(me_num);
		
		return mv;
	}
	
	@PostMapping("preInputProc")
	public String preInputProc(MultipartHttpServletRequest ms,RedirectAttributes rttr) {
		
		String view= null;
		log.info("preInputProc");
		view = pServ.insertPre(ms,rttr);
		
		return view;
	}
	
	@GetMapping("prescription")
	public ModelAndView prescription(int check, Integer pageNum) {
		mv = new ModelAndView();
		log.info("체크값:" + check);
		log.info("prescription");
		mv  = pServ.getPreList(check, pageNum);
		
		return mv;
	}
	
	@GetMapping(value = "pView",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> pView(int p_num){
		log.info("num값:" + p_num);
		Map<String, String> pmap = new HashMap<String, String>();
		pmap = pServ.pView(p_num);
		
		return pmap;
	}
	@GetMapping("deletePre")
	public String deletePre(int p_num, RedirectAttributes rttr) {
		log.info("deletePre" + p_num);
		String view = pServ.deletePre(p_num, rttr);
		
		return view;
	}
}
