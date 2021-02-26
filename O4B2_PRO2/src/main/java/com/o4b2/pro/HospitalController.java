package com.o4b2.pro;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.service.HospitalService;
import com.o4b2.pro.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
public class HospitalController {

	

	@Autowired
	private MemberService mServ;

	private ModelAndView mv;

	@Autowired
	private HospitalService hServ;

	@Autowired
	private HttpSession session;

	@PostMapping("hJoinProc")
	public String hJoinFrm(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		log.info("hJoinProc()");
		String view=null;
		view= hServ.hospitalInsert(multi, rttr);

		return view;
	}
	
	@GetMapping("hMain")
	public String hMain() {
		log.info("hMain");
		
		return "hMain";
	}
	
	@RequestMapping("HosSearchId")
    public String HosSearchId(Integer h_cn,
            RedirectAttributes rttr) {
        log.info("HosSearchId");
        String view = hServ.HosSearchId(h_cn, rttr);

        return view;
    }
	@GetMapping("doctorInput")
	public String doctorInput() {
		log.info("doctorInput");
		
		return "doctorInput";
	}
	
	@PostMapping("inputDoctorProc")
	public String inputDoctorProc(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		log.info("inputDoctorProc");
		String view =  hServ.inputDoctor(multi, rttr);
		
		return view;
	}
	
	@GetMapping("searchH")
	public ModelAndView searchH(String hos, int check) {
		log.info("searchH");
		
		mv = hServ.getSearch(hos, check);
		return mv;
	}
	
	@PostMapping("HospitalUpdate")
	public String HostpitalUpdate(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		
		log.info("HospitalUpdate");
		
		String view = hServ.HospitalUpdate(multi, rttr);
		
		return view;
	}
	
	@GetMapping("hosInfo")
	public String hosInfo() {
		log.info("hosInfo");
		
		return "hosInfo";
	}
	
	@GetMapping("hosInfoUpdate") 
	public String hosInfoUpdate() {
		log.info("hosInfoUpdate");
		
		return "hosInfoUpdate";
	}
	
	@GetMapping("hinfo")
	public ModelAndView hinfo(String hId) {
		log.info("hinfo");
		
		mv = hServ.getHosInfo(hId);
		return mv;
	}
	@GetMapping("hsearchId")
	public String hsearchId() {
		log.info("hsearchId");

		return "hsearchId";
	}
	@GetMapping("hsearchPwd")
	public String hsearchPwd() {
		log.info("hsearchPwd");

		return "hsearchPwd";
	}
	
	@GetMapping("docCalendar") 
	public ModelAndView docCalendar(String hId) {
		log.info("docCalendar");
		
		mv = hServ.getDocCal(hId);
		return mv;
	}
	
	@PostMapping(value = "docCalSel",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<String>> docCalSel(@RequestParam Map<String, Object> sche) {
		log.info("docCalSel");
		
		Map<String, List<String>> rMap = hServ.docCalSel(sche);
		return rMap;
	}
	
	@GetMapping("deleteDoctor")
	public String deleteDoctor(int d_num, RedirectAttributes rttr) {
		log.info("deleteDoctor");
		String view = hServ.deleteDoctor(d_num,rttr);
		
		return view;
	}
}
