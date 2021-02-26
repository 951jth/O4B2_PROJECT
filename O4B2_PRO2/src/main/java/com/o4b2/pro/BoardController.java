package com.o4b2.pro;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.o4b2.pro.dto.QcommentDto;
import com.o4b2.pro.dto.ScommentDto;
import com.o4b2.pro.service.BoardService;



@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService bServ;

	//ModelAndView 객체
	private ModelAndView mv;

	@GetMapping("sBoardList")
	public ModelAndView sBoardList(Integer pageNum,String hId) {
		logger.info("sBoardList");

		mv = bServ.getBoardList(pageNum, hId);

		return mv;
	}

	@GetMapping("qnaBoardList")
	public ModelAndView qnaBoard(Integer pageNum) {
		logger.info("qnaBoardList");

		mv = bServ.getQnaBoardList(pageNum);

		return mv;
	}

	@GetMapping("qnaWrite")
	public String qnaWrite() {
		logger.info("qnaWrite");

		return "qnaWrite";
	}

	@GetMapping("contents")
	public ModelAndView boardContents(Integer sbnum) {
		logger.info("boardContents() - bnum: " + sbnum);

		mv = bServ.getContents(sbnum);

		return mv;
	}

	@GetMapping("qnacontents")
	public ModelAndView qnaContents(Integer qbnum) {
		logger.info("qnaContents() - bnum: " + qbnum);

		mv = bServ.getQnaContents(qbnum);

		return mv;
	}


	@GetMapping("sBoardWrite")
	public ModelAndView sBoardWrite(String h_id) {
		logger.info("sBoardWrite");
		
		mv.addObject("h_id", h_id);
		mv.setViewName("sBoardWrite");
		return mv;
	}

	@PostMapping("boardWrite")
	public String boardWrite(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		logger.info("boardWrite()");

		String view = bServ.boardInsert(multi, rttr);

		return view;
	}

	@GetMapping("download")
	public void fileDownLoad(int sbnum, 
			HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("fileDownLoad() file: " + sbnum);

		bServ.fileDown(sbnum, request, response);
	}

	@GetMapping("qnaDownload")
	public void qnaFileDownLoad(int qbnum, 
			HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("fileDownLoad() file: " + qbnum);

		bServ.qnaFileDown(qbnum, request, response);
	}
	
	@PostMapping(value = "replyIns",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<ScommentDto>> 
	replyInsert(ScommentDto reply){
		Map<String, List<ScommentDto>> rMap = 
				bServ.replyInsert(reply);

		return rMap;
	}

	@PostMapping(value = "qnaReplyIns",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<QcommentDto>> 
	qnaReplyInsert(QcommentDto reply){
		Map<String, List<QcommentDto>> rMap = 
				bServ.qnaReplyInsert(reply);

		return rMap;
	}

	@PostMapping("qnaWriteProc")
	public String qnaWriteProc(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		logger.info("qnaWriteProc()");

		String view = bServ.qnaWrite(multi, rttr);

		return view;
	}
	@GetMapping("sBoardUp")
	public ModelAndView sBoardUp(String h_id) {
		logger.info("sBoardUp");
		
		mv.addObject("h_id", h_id);
		mv.setViewName("sBoardUp");
		return mv;
	}
	
	@PostMapping("sbUp")
	public String sbUp(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		logger.info("sbUp()");

		String view = bServ.sbUp(multi, rttr);

		return view;
	}
	
	@GetMapping("qBoardUp")
	public ModelAndView qBoardUp(String h_id) {
		logger.info("qBoardUp");
		
		mv.addObject("h_id", h_id);
		mv.setViewName("qBoardUp");
		return mv;
	}
	
	@PostMapping("qnaUp")
	public String qnaUp(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		logger.info("qnaUp()");

		String view = bServ.qnaUp(multi, rttr);

		return view;
	}

	@GetMapping("sBoardDelete")
	public String qBoardDelete(int s_num, 
			String h_id, RedirectAttributes rttr) {
		logger.info("sBoardDelete");
		
		String view = bServ.sBoardDel(s_num, h_id, rttr);
		
		return view;
	}
	@GetMapping("qBoardDelete")
	public String qBoardDelete(int q_num, 
			RedirectAttributes rttr) {
		logger.info("qBoardDelete");
		
		String view = bServ.qBoardDel(q_num, rttr);
		
		return view;
	}
}
