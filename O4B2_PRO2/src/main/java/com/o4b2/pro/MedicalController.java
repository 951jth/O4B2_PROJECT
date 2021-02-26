package com.o4b2.pro;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dto.MedicalDto;
import com.o4b2.pro.service.MedicalService;

@Controller
public class MedicalController {
	private static final Logger logger = LoggerFactory.getLogger(MedicalController.class);
	
	@Autowired
	private MedicalService mServ;
	
	//ModelAndView 객체
	private ModelAndView mv;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "urecheck", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView urecheckFrm(int check) {
		logger.info("urecheck");
		logger.info("체크값" + check);
		
		mv = mServ.getHosName(check);
				
		return mv;
	}
	
	@GetMapping("urecancel")
	public ModelAndView urecancel(int me_num) {
		logger.info("urecancel");
		
		mv = mServ.urecancel(me_num);
		return mv;
	}
	
	@GetMapping("mConfirm")
	public String mConfirm() {
		logger.info("mConfirm");

		return "mConfirm";
	}
	
	
	@PostMapping("reseIn")
	public String reseIn(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		logger.info("reseIn()");

		String view = mServ.reseIn(multi, rttr);

		return view;
	}
	
	@GetMapping("rese")
    public ModelAndView rese(String hId) {
        logger.info("rese");
        ModelAndView mv = new ModelAndView();
        mv = mServ.getHosDoc(hId);

        return mv;
    }
	
	@GetMapping("resecancelProc")
	public String resecancelProc(int me_num, RedirectAttributes rttr) {
		String view=null;
		logger.info("resecancelProc");
		view = mServ.resecancelProc(me_num, rttr);
		
		return view;
	}
	
	@GetMapping("resePermit")
	public String resePermit(int me_num, RedirectAttributes rttr) {
		String view=null;
		logger.info("resePermit");
		view = mServ.resePermit(me_num, rttr);
		return view;
	}
	
	@PostMapping("refuse")
	public String refuse(MedicalDto medi, RedirectAttributes rttr) {
		logger.info("refuse");
		String view = mServ.refuse(medi, rttr);
		//mv = mServ.refuse(medi, rttr);
		
		//return mv;
		return view;
	}
	
}
