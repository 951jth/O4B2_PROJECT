package com.o4b2.pro;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dto.ReviewDto;
import com.o4b2.pro.service.ReviewService;


@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	ReviewService rServ = new ReviewService();
	
	private ModelAndView mv;
	
	@GetMapping("reviewWrite")
	public ModelAndView rWrite(int check, String r_num) {
		mv = new ModelAndView();
		logger.info("reviewWrite");
		
		mv.addObject("check",check);
		mv.addObject("r_num", r_num);
		mv.setViewName("reviewWrite");
		return mv;
	}
	
	@GetMapping("reviewList")
	public ModelAndView reviewFrm(Integer pageNum) {
		logger.info("reviewList");
		ModelAndView mv = new ModelAndView();
		mv = rServ.getReviewList(pageNum);
		
		return mv;
	}
	@GetMapping(value = "reviewForm",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> reviewForm(ReviewDto rd){
		Map<String, String> rmap = new HashMap<String, String>();
		rmap = rServ.reviewForm(rd);
		
		return rmap;
	}
	@PostMapping("reviewWriteProc")
	public String reviewWriteProc(MultipartHttpServletRequest ms, 
			RedirectAttributes rttr) {
		logger.info("reivewWritePorc");
		String view = rServ.reviewWrite(ms,rttr);
		return view;
	}
	@GetMapping("rDelete")
	public String rDelete(int r_num, RedirectAttributes rttr) {
		logger.info("rDelete");
		logger.info("딜리트 r_num:" + r_num);
		String view = rServ.rDeleteProc(r_num, rttr);
		
		return view;
	}
}
