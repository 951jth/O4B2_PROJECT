package com.o4b2.pro.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dao.SboardDao;
import com.o4b2.pro.service.BoardService;
import com.o4b2.pro.dto.ScommentDto;
import com.o4b2.pro.dao.NoticeDao;
import com.o4b2.pro.dao.QboardDao;
import com.o4b2.pro.dto.NoticeDto;
import com.o4b2.pro.dto.PrescriptionDto;
import com.o4b2.pro.dto.QboardDto;
import com.o4b2.pro.dto.QcommentDto;
import com.o4b2.pro.dto.SboardDto;
import com.o4b2.pro.util.Paging;

import lombok.extern.java.Log;

@Service
@Log
public class BoardService {
	//DAO
	@Autowired
	private SboardDao sbDao;
	@Autowired
	private QboardDao qbDao;

	private ModelAndView mv;

	@Autowired
	private NoticeDao nDao;

	@Autowired
	private HttpSession session;

	//게시글 목록 가져오는 메소드
	public ModelAndView getBoardList(Integer pageNum, String hId) {
		log.info("getBoardList() - pageNum: " + pageNum);
		List<SboardDto> sList = new ArrayList<SboardDto>();
		mv = new ModelAndView();
		int num = (pageNum == null) ? 1 : pageNum;
		int snum = (num*10-9);
		int	lnum = num*10;
		int maxNum = sbDao.getBoardCnt(hId);
		int cnum = (maxNum < lnum)?  maxNum : lnum; 
		List<NoticeDto> nList = nDao.getNList("admin");
		List<SboardDto> sbList = sbDao.getList(hId);
		for(int a = snum; a < cnum; a++) {
			sList.add(sbList.get(a));
		}
		//DB에서 조회한 데이터 목록을 모델에 추가
		mv.addObject("sbList", sList);
		mv.addObject("nList", nList);
		//페이징 처리
		mv.addObject("paging", getPaging(num, 1, hId));

		//세션에 페이지 번호 저장
		session.setAttribute("pageNum", num);
		mv.addObject("h_id", hId);
		mv.setViewName("sBoardList");

		return mv;
	}//method end

	//qna게시글 목록 가져오는 메소드
	public ModelAndView getQnaBoardList(Integer pageNum) {
		log.info("getQnaBoardList() - pageNum: " + pageNum);

		mv = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;

		List<QboardDto> qbList = qbDao.getList(num);
		List<NoticeDto> nList = nDao.getNList("admin");

		//DB에서 조회한 데이터 목록을 모델에 추가
		mv.addObject("qbList", qbList);
		mv.addObject("nList", nList);
		//페이징 처리
		mv.addObject("qnaPaging", getPaging(num, 2, "qna"));

		//세션에 페이지 번호 저장
		session.setAttribute("pageNum", num);

		mv.setViewName("qnaBoardList");

		return mv;
	}//method end

	private String getPaging(int num, int check, String hId) {
		//전체 글 개수 구하기(from DB)
		int maxNum = 0;
		if(check == 1) {
			maxNum = sbDao.getBoardCnt(hId);
		}
		else if(check == 2) {
			maxNum = qbDao.getBoardCnt();
		}
		//설정값(페이지 당 글 개수, 그룹 당 페이지 개수, 게시판 이름)
		int listCnt = 10;
		int pageCnt = 2;
		String listName = "list";

		Paging paging = new Paging(maxNum, num, listCnt,
				pageCnt, listName);

		String pagingHtml = paging.makePaging();

		return pagingHtml;
	}

	public ModelAndView getContents(Integer sbnum) {
		mv = new ModelAndView();

		//조회수 1 증가
		sbDao.viewUpdate(sbnum);

		//글내용 가져오기
		SboardDto sBoard = sbDao.getContents(sbnum);

		//파일목록 가져오기
		String sbfList = sbDao.getBfListS(sbnum);

		//댓글목록 가져오기
		List<ScommentDto> scomment = sbDao.getReplyList(sbnum);

		//모델 데이터 담기
		mv.addObject("sBoard", sBoard);
		mv.addObject("sbfList", sbfList);
		mv.addObject("scomment", scomment);

		//뷰 이름 지정하기
		mv.setViewName("sBoardView");

		return mv;
	}

	public ModelAndView getQnaContents(Integer qbnum) {
		mv = new ModelAndView();

		//글내용 가져오기
		QboardDto qBoard = qbDao.getContents(qbnum);

		//파일목록 가져오기
		String qbfList = qbDao.getBfListQ(qbnum);

		//댓글목록 가져오기
		List<QcommentDto> qcomment = qbDao.getReplyList(qbnum);

		//모델 데이터 담기
		mv.addObject("qBoard", qBoard);
		mv.addObject("qbfList", qbfList);
		mv.addObject("qcomment", qcomment);

		//뷰 이름 지정하기
		mv.setViewName("qnaBoardView");

		return mv;
	}

	//게시글 등록 서비스 메소드
	@Transactional
	public String boardInsert(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		log.info("boardInsert()");

		String view = null;

		String id = multi.getParameter("mid");
		String title = multi.getParameter("sbname");
		String contents = multi.getParameter("sbcomment");
		String check = multi.getParameter("fileCheck");
		String h_id = multi.getParameter("h_id");

		//textarea는 입력한 문자열 앞뒤로 공백이 발생.
		//문자열 앞뒤 공백 제거. trim()
		contents = contents.trim();

		SboardDto board = new SboardDto();
		board.setM_id(id);
		board.setSb_name(title);
		board.setSb_comment(contents);
		board.setH_id(h_id);

		try {
			sbDao.sboardInsert(board);
			//파일 업로드 메소드 호출
			if(check.equals("1")) {
				fileUp(multi, board.getSb_num(), 1);
			}
			view = "redirect:sBoardList?hId=" + board.getH_id();
			rttr.addFlashAttribute("msg", "글 등록 성공");
		}catch(Exception e) {
			//e.printStackTrace();
			view = "redirect:sBoardWrite";
			rttr.addFlashAttribute("msg", "글 등록 실패");
		}

		return view;
	}

	//파일 업로드 처리 메소드
	public boolean fileUp(MultipartHttpServletRequest multi,
			int bnum, int check) throws Exception {
		//저장공간에 대한 절대 경로 구하기
		String path = multi.getSession().getServletContext()
				.getRealPath("/");

		path += "resources/upload/";
		log.info(path);

		File dir = new File(path);

		if(dir.isDirectory() == false) {
			dir.mkdir();//폴더가 없을 경우 폴더 생성.
		}

		//실제 파일명과 저장 파일명을 함께 관리
		Map<String, String> fmap = 
				new HashMap<String, String>();

		//파일 전송시 기본 값을 파일다중 선택임.
		//멀티파트 요청 객체에서 꺼내올 때는 List를 사용.
		List<MultipartFile> fList = multi.getFiles("files");

		for(int i = 0; i < fList.size(); i++) {
			MultipartFile mf = fList.get(i);
			String on = mf.getOriginalFilename();

			//변경된 파일 이름 저장
			String sn = System.currentTimeMillis()
					+ "." //확장자 구분 점
					+ on.substring(on.lastIndexOf(".") + 1);
			if(check == 1) {
				fmap.put("sb_file", sn);
			}
			else if(check == 2) {
				fmap.put("qb_file", sn);
			}
			//해당 폴더에 파일 저장하기
			mf.transferTo(new File(path + sn));

		}
		if(check == 1) {
			fmap.put("sb_num", String.valueOf(bnum));

			sbDao.fileInsert(fmap);
		}
		else if(check == 2) {
			fmap.put("qb_num", String.valueOf(bnum));

			qbDao.fileInsert(fmap);	
		}

		return true;
	}

	public void fileDown(int sbnum, 
			HttpServletRequest request, 
			HttpServletResponse response) {
		//서버의 파일 위치의 절대 경로 구하기
		String path = request.getSession().getServletContext()
				.getRealPath("/");

		path += "resources/upload/";
		log.info(path);

		String filename = sbDao.getfile(sbnum);
		path += filename;//다운로드할 파일경로+파일명

		//서버 저장장치(디스크)에서 저장된 파일을 읽어오는 통로
		InputStream is = null;
		//사용자 컴퓨터에 파일을 보내는 통로
		OutputStream os = null;

		try {
			//파일명 인코딩(파일명이 한글일 때 깨짐을 방지)
			String dFileName = URLEncoder.encode(filename, "UTF-8");

			//파일 객체 생성
			File file = new File(path);
			is = new FileInputStream(file);

			//응답 객체(response)의 헤더 설정
			//파일전송용 contentType 설정
			response.setContentType("application/octet-stream");
			response.setHeader("content-Disposition", 
					"attachment; filename=\"" + dFileName + "\"");
			//attachment; filename="가나다라.jpg"

			//응답 객체와 보내는 통로 연결
			os = response.getOutputStream();

			//파일 전송(byte 단위로 전송)
			byte[] buffer = new byte[1024];
			int length;
			while((length = is.read(buffer)) != -1) {
				os.write(buffer, 0, length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				os.flush();//os에 남아 있을지 모르는 데이터를
				//강제로 전부 보내도록 처리.

				os.close();
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void qnaFileDown(int qbnum, 
			HttpServletRequest request, 
			HttpServletResponse response) {
		//서버의 파일 위치의 절대 경로 구하기
		String path = request.getSession().getServletContext()
				.getRealPath("/");

		path += "resources/upload/";
		log.info(path);

		String filename = qbDao.getfile(qbnum);
		path += filename;//다운로드할 파일경로+파일명

		//서버 저장장치(디스크)에서 저장된 파일을 읽어오는 통로
		InputStream is = null;
		//사용자 컴퓨터에 파일을 보내는 통로
		OutputStream os = null;

		try {
			//파일명 인코딩(파일명이 한글일 때 깨짐을 방지)
			String dFileName = URLEncoder.encode(filename, "UTF-8");

			//파일 객체 생성
			File file = new File(path);
			is = new FileInputStream(file);

			//응답 객체(response)의 헤더 설정
			//파일전송용 contentType 설정
			response.setContentType("application/octet-stream");
			response.setHeader("content-Disposition", 
					"attachment; filename=\"" + dFileName + "\"");
			//attachment; filename="가나다라.jpg"

			//응답 객체와 보내는 통로 연결
			os = response.getOutputStream();

			//파일 전송(byte 단위로 전송)
			byte[] buffer = new byte[1024];
			int length;
			while((length = is.read(buffer)) != -1) {
				os.write(buffer, 0, length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				os.flush();//os에 남아 있을지 모르는 데이터를
				//강제로 전부 보내도록 처리.

				os.close();
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	//댓글 저장 서비스 메소드
	@Transactional
	public Map<String, List<ScommentDto>> 
	replyInsert(ScommentDto reply){
		Map<String, List<ScommentDto>> rMap = null;

		try {
			//댓글을 DB에 입력
			sbDao.replyInsert(reply);

			//댓글 목록을 다시 검색
			List<ScommentDto> rList = 
					sbDao.getReplyList(reply.getSb_num());
			rMap = new HashMap<String, List<ScommentDto>>();
			rMap.put("rList", rList);
		}catch (Exception e) {
			//e.printStackTrace();
			rMap = null;
		}

		return rMap;
	}

	//qna 댓글 저장 서비스 메소드
	@Transactional
	public Map<String, List<QcommentDto>> 
	qnaReplyInsert(QcommentDto reply){
		Map<String, List<QcommentDto>> rMap = null;

		try {
			//댓글을 DB에 입력
			qbDao.replyInsert(reply);

			//댓글 목록을 다시 검색
			List<QcommentDto> rList = 
					qbDao.getReplyList(reply.getQb_num());
			rMap = new HashMap<String, List<QcommentDto>>();
			rMap.put("rList", rList);
		}catch (Exception e) {
			//e.printStackTrace();
			rMap = null;
		}

		return rMap;
	}

	//qna게시글 등록 서비스 메소드
	@Transactional
	public String qnaWrite(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		log.info("qnaWrite()");

		String view = null;

		String id = multi.getParameter("mid");
		String title = multi.getParameter("subject");
		String contents = multi.getParameter("content");
		String check = multi.getParameter("fileCheck");

		//textarea는 입력한 문자열 앞뒤로 공백이 발생.
		//문자열 앞뒤 공백 제거. trim()
		contents = contents.trim();

		QboardDto board = new QboardDto();
		board.setM_id(id);
		board.setQb_title(title);
		board.setQb_contents(contents);

		try {
			qbDao.qboardInsert(board);
			//파일 업로드 메소드 호출
			if(check.equals("1")) {
				fileUp(multi, board.getQb_num(), 2);
			}
			view = "redirect:qnaBoardList";
			rttr.addFlashAttribute("msg", "글 등록 성공");
		}catch(Exception e) {
			//e.printStackTrace();
			view = "redirect:qnaWrite";
			rttr.addFlashAttribute("msg", "글 등록 실패");
		}

		return view;
	}
	
	@GetMapping("sBoardUp")
	public ModelAndView sBoardUp(String h_id) {
		log.info("sBoardUp");
		
		mv.addObject("h_id", h_id);
		mv.setViewName("sBoardUp");
		return mv;
	}

	//게시글 수정 서비스 메소드
	@Transactional
	public String sbUp(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		log.info("sbUp()");

		String view = null;

		String title = multi.getParameter("sbname");
		String sbNum = multi.getParameter("sb_num");
		String contents = multi.getParameter("sbcomment");
		String h_id = multi.getParameter("h_id");

		//textarea는 입력한 문자열 앞뒤로 공백이 발생.
		//문자열 앞뒤 공백 제거. trim()
		contents = contents.trim();

		SboardDto board = new SboardDto();
		
		board.setSb_name(title);
		board.setSb_num(Integer.parseInt(sbNum));
		board.setSb_comment(contents);

		try {
			sbDao.sboardUp(board);
			
			view = "redirect:sBoardList?hId=" + h_id;
			rttr.addFlashAttribute("msg", "글 수정 성공");
		}catch(Exception e) {
			//e.printStackTrace();
			view = "redirect:sBoardUp?hId=" + h_id;
			rttr.addFlashAttribute("msg", "글 수정 실패");
		}

		return view;
	}
	
	//qna 수정 서비스 메소드
		@Transactional
		public String qnaUp(MultipartHttpServletRequest multi,
				RedirectAttributes rttr) {
			log.info("qnaUp()");

			String view = null;

			String title = multi.getParameter("subject");
			String qbNum = multi.getParameter("qb_num");
			String contents = multi.getParameter("content");

			//textarea는 입력한 문자열 앞뒤로 공백이 발생.
			//문자열 앞뒤 공백 제거. trim()
			contents = contents.trim();

			QboardDto board = new QboardDto();
			
			board.setQb_title(title);
			board.setQb_num(Integer.parseInt(qbNum));
			board.setQb_contents(contents);

			try {
				qbDao.qboardUp(board);
				
				view = "redirect:qnaBoardList";
				rttr.addFlashAttribute("msg", "글 수정 성공");
			}catch(Exception e) {
				//e.printStackTrace();
				view = "redirect:sBoardWrite";
				rttr.addFlashAttribute("msg", "글 수정 실패");
			}

			return view;
		}
	public String sBoardDel(int s_num,String h_id, RedirectAttributes rttr) {
		String view = null;
		try {
			sbDao.replyDelete(s_num);
			sbDao.boardDelete(s_num);	
			view = "redirect:sBoardList?hId=" + h_id;
			rttr.addFlashAttribute("msg","삭제성공");
		} catch (Exception e) {
			// TODO: handle exception
			view = "redirect:sBoardList?hId="+ h_id;
			rttr.addFlashAttribute("msg","삭제실패");
		}
		
		return view;
	}
	public String qBoardDel(int q_num,RedirectAttributes rttr) {
		String view = null;
		try {
			qbDao.replyDelete(q_num);
			qbDao.boardDelete(q_num);	
			view = "redirect:qnaBoardList";
			rttr.addFlashAttribute("msg","삭제성공");
		} catch (Exception e) {
			// TODO: handle exception
			view = "redirect:qnaBoardList";
			rttr.addFlashAttribute("msg","삭제실패");
		}
		
		return view;
	}
}
