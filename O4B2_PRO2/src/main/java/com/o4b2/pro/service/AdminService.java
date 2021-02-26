package com.o4b2.pro.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.o4b2.pro.dao.NoticeDao;
import com.o4b2.pro.dto.NoticeDto;

import lombok.extern.java.Log;

@Log
@Service
public class AdminService {
	@Autowired
	private NoticeDao nDao;
	private ModelAndView mv;


	public ModelAndView insertNt(MultipartHttpServletRequest mf, RedirectAttributes rttr) {
		mv = new ModelAndView();
		NoticeDto nDto = new NoticeDto();
		String n_name = mf.getParameter("n_name");
		String m_id = mf.getParameter("m_id");
		//String n_file = mf.getParameter("files");
		String n_content = mf.getParameter("n_content");
		String n_pwd = mf.getParameter("n_pwd");
		String check = mf.getParameter("fileCheck");;
		nDto.setM_id(m_id);
		nDto.setN_content(n_content);
		nDto.setN_pwd(n_pwd);
		nDto.setN_name(n_name);
		
		try {
			nDao.insertN(nDto);
			if(check.equals("1")) {
				fileUp(mf, nDto.getN_num());
			}
			rttr.addFlashAttribute("msg", "등록성공");
			mv.setViewName("redirect:admin");
		} catch (Exception e) {
			// TODO: handle exception
			rttr.addFlashAttribute("msg", "등록실패");
			mv.setViewName("redirect:noticeWrite");
		}	
		return mv;
	}


	public boolean fileUp(MultipartHttpServletRequest mf,
				int n_num) throws Exception {
			//저장공간에 대한 절대 경로 구하기
			String path = mf.getSession().getServletContext()
					.getRealPath("/");

			path += "resources/upload/";
			log.info(path);

			File dir = new File(path);

			if(dir.isDirectory() == false) {
				dir.mkdir();
			}

			//실제 파일명과 저장 파일명을 함께 관리
			Map<String, String> fmap = 
					new HashMap<String, String>();

			//파일 전송시 기본 값을 파일다중 선택임.
			//멀티파트 요청 객체에서 꺼내올 때는 List를 사용.
			List<MultipartFile> fList = mf.getFiles("files");

			for(int i = 0; i < fList.size(); i++) {
				MultipartFile mf2 = fList.get(i);
				String on = mf2.getOriginalFilename();

				//변경된 파일 이름 저장
				String sn = System.currentTimeMillis()
						+ "." //확장자 구분 점
						+ on.substring(on.lastIndexOf(".") + 1);
					fmap.put("n_file", sn);
				//해당 폴더에 파일 저장하기
				mf2.transferTo(new File(path + sn));

			}
				fmap.put("n_num", String.valueOf(n_num));
				nDao.fileInsert(fmap);


			return true;
	}


	public ModelAndView noticeView(int n_num) {
		mv = new ModelAndView();
		NoticeDto nDto = nDao.getNotice(n_num);
		String nfList = nDao.nfList(n_num);
		nDao.nViewUp(n_num);
		
		mv.addObject("nDto", nDto);
		mv.addObject("nfList", nfList);
		mv.setViewName("noticeView");
		return mv;
	}


	public void nFileDown(int n_num, HttpServletRequest request, HttpServletResponse response) {
		//서버의 파일 위치의 절대 경로 구하기
		String path = request.getSession().getServletContext()
				.getRealPath("/");
		path += "resources/upload/";
		log.info(path);
		
		String filename = nDao.nfList(n_num);
		path += filename;
		
		//서버 저장장치(디스크)에서 저장된 파일을 읽어오는 통로
		InputStream is = null;
		//사용자 컴퓨터에 파일을 보내는 통로
		OutputStream os = null;
			
		try {
			//파일명 인코딩(파일명이 한글일 때 깨짐을 방지)
			String nFileName = URLEncoder.encode(filename, "UTF-8");

			//파일 객체 생성
			File file = new File(path);
			is = new FileInputStream(file);

			//응답 객체(response)의 헤더 설정
			//파일전송용 contentType 설정
			response.setContentType("application/octet-stream");
			response.setHeader("content-Disposition", 
					"attachment; filename=\"" + nFileName + "\"");
			//attachment; filename="가나다라.jp
			
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


	public ModelAndView nUpdate(MultipartHttpServletRequest ms, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();
		NoticeDto nDto = new NoticeDto();
		nDto.setN_name(ms.getParameter("n_name"));
		nDto.setN_content(ms.getParameter("n_content"));
		int n_num =Integer.parseInt(ms.getParameter("n_num"));
		nDto.setN_num(n_num);
		String check = ms.getParameter("fileCheck");
		mv.addObject("n_num", n_num);
		try {
			nDao.nUpdate(nDto);
			if(check.equals("1")) {
				fileUp(ms,n_num);
			}
			mv.setViewName("redirect:noticeView");
			rttr.addFlashAttribute("msg","수정성공");
		} catch (Exception e) {
			// TODO: handle exception;
			mv.setViewName("redirect:noticeView");
			rttr.addFlashAttribute("msg","수정실패");
		}
		
		return mv;
	}


	public String deleteN(int n_num, RedirectAttributes rttr) {
		String view= null;
		try {
			nDao.deleteN(n_num);
			view="redirect:admin";
			rttr.addFlashAttribute("msg","삭제성공");
		} catch (Exception e) {
			// TODO: handle exception
			view="noticeView?n_num="+n_num;
			rttr.addFlashAttribute("msg","삭제실패");
		}
		
		return view;
	}
	
	
	
	

}
