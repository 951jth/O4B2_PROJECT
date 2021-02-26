package com.o4b2.pro;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dto.HospitalDto;
import com.o4b2.pro.dto.MemberDto;
import com.o4b2.pro.service.HospitalService;
import com.o4b2.pro.service.MemberService;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService mServ;
	
	private ModelAndView mv;
	
	@Autowired
	private HospitalService hServ;

	@Autowired
	private HttpSession session;
	
	@GetMapping("/")
	public String home() {
		logger.info("home()");
		
		return "home";
	}
	@GetMapping("joinFrm")
	public String joinFrm() {
		logger.info("joinFrm()");
		
		return "joinFrm";
	}
	
	@GetMapping("loginFrm")
	public String loginFrm() {
		logger.info("loginFrm");
		
		return "loginFrm";
	}
	
	
	@PostMapping("loginProc")
	public String loginProc(MemberDto member, RedirectAttributes rttr) {
		logger.info("loginProc");
		String view = mServ.loginProc(member, rttr);
		
		return view;
	}
	
	@PostMapping("hLoginProc")
	public String hLoginProc(HospitalDto hospital, RedirectAttributes rttr) {
		logger.info("hLoginProc");
		String view = mServ.hLoginProc(hospital, rttr);
		
		return view;
	}
	
	@PostMapping("joinProc")
	public String joinProc(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		logger.info("joinProc");
		String view = mServ.joinProc(multi, rttr);
		
		return view;
	}
	
	@PostMapping("MemberUpdate")
	public String MemberUpdate(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		logger.info("MemberUpdate");
		String view = mServ.MemberUpdate(multi, rttr);
		
		return view;
	}
	
	@GetMapping("hinformList")
    public String hinformList() {
        logger.info("hinformList");

        return "hinformList";
    }

    
    @GetMapping("searchHp")
    public String searchHp() {
        logger.info("searchHp");

        return "searchHp";
    }
    @GetMapping("jusoPopup")
    public String jusoPopup() {
        logger.info("jusoPopup");

        return "jusoPopup";
    }
    
	
	
	@GetMapping("myInform")
	public String myInform() {
		logger.info("myInform");
		
		return "myInform";
	}
	
	@GetMapping("searchId")
	public String searchId() {
		logger.info("searchId");
		
		return "searchId";
	}
	@GetMapping("searchPwd")
	public String searchPwd() {
		logger.info("searchPwd");
		
		return "searchPwd";
	}
	
	@GetMapping("ApiLocation")
	public String ApiLocation() {
		logger.info("ApiLocation");
		
		return "joinFrm";
	}
	@GetMapping("myInfo")
	public String myInfo() {
		logger.info("myInfo");
		
		return "myInfo";
	}
	@GetMapping("myInfoUpdate")
	public String myInfoUpdate() {
		logger.info("myInfoUpdate");
		
		return "myInfoUpdate";
	}
	
	@GetMapping("logoutProc")
	public String logoutProc(RedirectAttributes rttr) {
		logger.info("logoutProc");
		mServ.logoutProc(rttr);
		return mServ.logoutProc(rttr);
	}
	
	@RequestMapping("MsearchId")
	public String MsearchId(Integer m_phone,
			RedirectAttributes rttr) {
		logger.info("MsearchId");
		String view = mServ.MsearchId(m_phone, rttr);
		
		return view;
	}
	
	@GetMapping("MsearchPwd")
	public String MsearchPwd(MemberDto member,
			RedirectAttributes rttr) {
		logger.info("MsearchPwd");
		String view = mServ.MsearchPwd(member, rttr);
		
		return view;
	}
	@GetMapping(value = "idCheck", 
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(String id, String num) {
		logger.info("idCheck() id: " + id);
		logger.info("num:" +  num) ;
		String result = mServ.idCheck(id, num);
		
		return result;
	}
	
	@GetMapping("myInfoDelete")
	public String myInfoDelete(String m_id, String m_pwd, RedirectAttributes rttr) {
		logger.info("myInfoDelete: " + m_id, m_pwd);
		String view = mServ.memberDelete(m_id,m_pwd,rttr);
		return view;
	}
	
}
