package com.o4b2.pro.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dao.ReviewDao;
import com.o4b2.pro.dto.MemberDto;
import com.o4b2.pro.dto.ReviewDto;
import com.o4b2.pro.util.rPaging;

import lombok.extern.java.Log;
@Log
@Service
public class ReviewService {
	@Autowired
	private ReviewDao rDao;

	@Autowired
	private HttpSession session;

	private ModelAndView mv;

	public ModelAndView getReviewList(Integer pageNum) {
		log.info("getReviewList() - pageNum: " + pageNum);
		mv = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;

		List<ReviewDto> rList = rDao.getList(num);
		log.info("리스트 값 : " + rList);
		mv.addObject("rList", rList);
		mv.addObject("rPaging", getPaging(num,2));

		session.setAttribute("rPage" , num);
		mv.setViewName("reviewList");

		return mv;
	}

	private String getPaging(int num, int check) {
		//전체 글 개수
		int maxNum = 0;
		if(check == 1) {
			maxNum = rDao.getReviewCnt();
		}
		else if(check == 2) {
			maxNum = rDao.getReviewCnt();
		}

		int listCnt = 5;
		int pageCnt = 10;
		String listName = "list";

		rPaging rPaging = new rPaging(maxNum, num , listCnt,
				pageCnt, listName);

		String pagingHtml = rPaging.makerPaging();

		return pagingHtml;	
	}

	public ModelAndView getContents(Integer r_num) {
		mv = new ModelAndView();

		ReviewDto review = rDao.getContents(r_num);
		//파일목록 가져오기 기능.
		//String rfList = rDao.getRfLists(r_num);
		mv.addObject("review", review);
		//mv.addObject("rfList", rfList);

		return mv;
	}

	public Map<String, String> reviewForm(ReviewDto rd) {
		int r_num = rd.getR_num();
		ReviewDto rView = rDao.reviewSelect(r_num);
		log.info("rView");
		Map<String, String> rmap = new HashMap<String, String>();
		int r_star = rView.getR_star();
		String star ="";
		for(int a = 0; a < r_star; a++) {
			star += "★";
		}
		rmap.put("r_title", rView.getR_title());
		rmap.put("r_star", star);
		rmap.put("r_contents", rView.getR_contents());
		rmap.put("m_id", rView.getM_id());
		rmap.put("h_name", rView.getH_name());
		rmap.put("d_name", rView.getD_name());
		rmap.put("r_image", rView.getR_image());
		return rmap;
	}

	public String reviewWrite(MultipartHttpServletRequest ms
			,RedirectAttributes rttr) {
		String view = null;
		MemberDto member = (MemberDto) session.getAttribute("mb");
		String id = member.getM_id();
		String name = ms.getParameter("h_name");
		String dname = ms.getParameter("d_name");
		String title = ms.getParameter("r_title");
		String contents = ms.getParameter("r_contents");
		String star = ms.getParameter("r_star");
		String check = ms.getParameter("filecheck");
		String ucheck = ms.getParameter("ucheck");
		
		contents = contents.trim();
		log.info("체크값" + check);
		int istar = Integer.parseInt(star);


		//String sdate = (String)date;
		ReviewDto rv = new ReviewDto();

		rv.setM_id(id);
		rv.setH_name(name);
		rv.setD_name(dname);
		rv.setR_title(title);
		rv.setR_contents(contents);
		rv.setR_star(istar);

		if(ucheck != null) {
			try {
				String r_num = ms.getParameter("r_num");
				int num =Integer.parseInt(r_num);
				rv.setR_num(num);
				rDao.updateReview(rv);
				view="redirect:reviewList";
				rttr.addFlashAttribute("msg", "리뷰 수정성공");
			} catch (Exception e) {
				// TODO: handle exception
				view="redirect:reviewList";
				rttr.addFlashAttribute("msg", "리뷰 수정실패");
			}
		}
		else {
			try {
				rDao.reviewWrite(rv);
				if(check.equals("1")) {
					log.info("check값" + check);
					fileUp(ms, rv.getR_num());
				}
				view="redirect:reviewList";
				rttr.addFlashAttribute("msg", "리뷰 등록성공");
			} catch (Exception e) {
				view="redirect:reviewWrite";
				rttr.addFlashAttribute("msg", "리뷰 등록실패");
			}
		}
		return view;
	}

	public boolean fileUp(MultipartHttpServletRequest multi,
			int r_num) throws Exception {
		//저장공간에 대한 절대 경로 구하기
		String path = multi.getSession().getServletContext()
				.getRealPath("/");

		path += "resources/upload/";
		log.info(path);

		File dir = new File(path);

		if(dir.isDirectory() == false) {
			dir.mkdir();
		}

		Map<String, String> fmap = 
				new HashMap<String, String>();


		List<MultipartFile> RList = multi.getFiles("r_image");
		for(int i = 0; i < RList.size(); i++) {
			MultipartFile rf = RList.get(i);
			String on = rf.getOriginalFilename();
			//변경된 파일 이름 저장
			String sn = System.currentTimeMillis()
					+ "." //확장자 구분 점
					+ on.substring(on.lastIndexOf(".") + 1);
			fmap.put("r_image", sn);
			rf.transferTo(new File(path + sn));

		}
		fmap.put("r_num", String.valueOf(r_num));
		rDao.fileInsert(fmap);
		return true;
	}

	public String rDeleteProc(int r_num, RedirectAttributes rttr) {
		log.info("rDeleteProc");
		String view = null;
		try {
			rDao.rDeleteProc(r_num);
			view = "redirect:reviewList";
			rttr.addFlashAttribute("msg","삭제성공");
		} catch (Exception e) {
			view = "redirect:reviewList";
			rttr.addFlashAttribute("msg","삭제실패");
		}

		return view;
	}
}
