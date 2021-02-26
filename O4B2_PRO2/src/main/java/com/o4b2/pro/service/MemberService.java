package com.o4b2.pro.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dao.HospitalDao;
import com.o4b2.pro.dao.MemberDao;
import com.o4b2.pro.dto.HospitalDto;
import com.o4b2.pro.dto.MemberDto;

import lombok.extern.java.Log;

@Log
@Service
public class MemberService {
	//dao 객체

	@Autowired
	private MemberDao mDao;

	@Autowired
	private HospitalDao hDao;
	@Autowired
	private HttpSession session;

	private ModelAndView mv;

	public String loginProc(MemberDto member, RedirectAttributes rttr) {
		String view = null;
		String encPwd = mDao.getEncPwd(member.getM_id());

		BCryptPasswordEncoder pwdEncode = 
				new BCryptPasswordEncoder();

		if(encPwd != null) {
			if(pwdEncode.matches(member.getM_pwd(), encPwd)) {
				//암호화된 비밀번호와 입력한 비밀번호가 같으면 true
				member = mDao.getMemberInfo(member.getM_id());
				session.setAttribute("mb", member);

				view="redirect:/";
				rttr.addFlashAttribute("msg", "로그인 성공");
				if(member.getM_id().equals("admin")) {
					view="redirect:admin";
				}
			}
			else {
				view="redirect:loginFrm";
				rttr.addFlashAttribute("msg", "비밀번호 오류");
			}
		}
		else {
			view="redirect:loginFrm";
			rttr.addFlashAttribute("msg", "아이디없음");
		}


		return view;

	}

	public String hLoginProc(HospitalDto hospital, RedirectAttributes rttr) {
		String view = null;
		String hencPwd = hDao.getHPwd(hospital.getH_id());

		BCryptPasswordEncoder pwdEncode = 
				new BCryptPasswordEncoder();
		if(hencPwd != null){
			if(pwdEncode.matches(hospital.getH_pwd(), hencPwd)) {
				hospital = hDao.getHospitalInfo(hospital.getH_id());
				session.setAttribute("hb", hospital);
				view="redirect:hMain";
				rttr.addFlashAttribute("msg", "로그인 성공");
			}
			else {
				view="redirect:loginFrm";
				rttr.addFlashAttribute("msg", "비밀번호 오류");
			}
		}
		else {
			view="redirect:loginFrm";
			rttr.addFlashAttribute("msg", "아이디없음");
		}

		return view;

	}

	public String logoutProc(RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("msg", "로그아웃 되었습니다.");

		return "home";
	}

	@Transactional
	public String joinProc(MultipartHttpServletRequest multi, 
			RedirectAttributes rttr) {

		log.info("joinProc");

		String view = null;
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();

		String id = multi.getParameter("m_id");
		String pwd = multi.getParameter("m_pwd");
		String name = multi.getParameter("m_name");
		String dd = multi.getParameter("dd");
		String mm = multi.getParameter("mm");
		String yyyy = multi.getParameter("yyyy");
		String gender = multi.getParameter("gender");
		String phone = multi.getParameter("m_phone");
		String mail = multi.getParameter("m_mail");

		String ra = multi.getParameter("RA");
		String ja = multi.getParameter("JA");
		String da = multi.getParameter("DA");
		String pc = multi.getParameter("PC");

		int pdd = Integer.parseInt(dd);
		int pmm = Integer.parseInt(mm);
		int pyyyy = Integer.parseInt(yyyy);
		int pphone = Integer.parseInt(phone);

		MemberDto member = new MemberDto();

		String encPwd = pwdEncoder.encode(pwd);

		member.setM_id(id);
		member.setM_pwd(encPwd);

		member.setM_name(name);
		member.setM_phone(pphone);
		member.setM_addr(ra + "/" + ja + "/" + da + "/" + pc);
		member.setM_birth(pyyyy + pmm + pdd);
		member.setM_rrn(1);
		member.setM_gender(gender);
		member.setM_mail(mail);	

		try {
			mDao.memberInsert(member);
			session.setAttribute("mb", member);
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "가입 성공");
		} catch(Exception e) {
			view = "redirect:joinFrm";
			rttr.addFlashAttribute("msg" , "가입 실패");
		}
		return view;
	}

	@Transactional
	public String MemberUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		log.info("MemberUpdate");

		String view = null;
		BCryptPasswordEncoder pwdEncoder =
				new BCryptPasswordEncoder();
		MemberDto member = new MemberDto();	

		String pass = multi.getParameter("m_pwd");

		String encPwd = pwdEncoder.encode(pass);

		String phone = multi.getParameter("m_phone");
		String mail = multi.getParameter("m_mail");
		String id = multi.getParameter("m_id");

		member.setM_pwd(encPwd); 
		member.setM_mail(mail);
		member.setM_phone(Integer.parseInt(phone));
		member.setM_id(id); 
		log.info("멤버값:" + member);
		try {
			mDao.MemberUpdate(member);
			view = "redirect:/";
			rttr.addFlashAttribute("msg", "수정 성공");
		} catch(Exception e) {
			view = "redirect:myInfo";
			rttr.addFlashAttribute("msg" , "수정 실패");
		}
		return view;

	}

	@Transactional
	public String MsearchId(Integer m_phone, RedirectAttributes rttr) {

		log.info("service_MsearchId() : " + m_phone);

		String id = mDao.MsearchId(m_phone);
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
	public String MsearchPwd(MemberDto member,RedirectAttributes rttr) {

		log.info("service_MsearchPwd() : " + member);

		String encPwd = mDao.getEncPwd(member.getM_id());
		String rawPassword = mDao.getEncPwd(member.getM_id());//원래 비번을 가져온다.
		member.setM_pwd(encPwd);

		BCryptPasswordEncoder pwdEncode = 
				new BCryptPasswordEncoder();

		String view = null;

		log.info("pwd : " + encPwd);

		if(encPwd != null || encPwd != "") {
			if(pwdEncode.matches(member.getM_pwd(), encPwd)) {
				member = mDao.getMemberInfo(member.getM_id());
				session.setAttribute("mb", member);

				view = "redirect:loginFrm";
				rttr.addFlashAttribute("msg","찾으시는 비밀번호는 " + encPwd + " 입니다.");
			}
		}
		else {
			view = "redirect:loginFrm";
			rttr.addFlashAttribute("msg", "검색된 비밀번호가 없습니다.");
		}      
		return view;

	}
	public String idCheck(String id, String num) {
		log.info("idChech() id: " + id);
		int cnt = 0;
		String result = null;
		if(num.equals("1")) {
			cnt = mDao.idCheck(id);
		}
		else {
			cnt = hDao.idCheck(id);
		}

		if(cnt == 0) {
			//사용 가능 아이디
			result = "success";
		}
		else {
			//중복된 아이디
			result = "fail";
		}

		return result;
	}

	public String memberDelete(String m_id, String m_pwd, RedirectAttributes rttr) {
		log.info("memberDelete");
		String view = null;
		String epwd =  mDao.getEncPwd(m_id);

		BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
		if(encode.matches(m_pwd, epwd)) {
			try {
				mDao.memberDelete(m_id);
				rttr.addFlashAttribute("msg","삭제성공");
				session.invalidate();
				view = "redirect:/";
			} catch (Exception e) {
				// TODO: handle exception
				rttr.addFlashAttribute("msg","삭제실패");
				view = "myInfo";
			}
		}
		return view;
	}
	
}