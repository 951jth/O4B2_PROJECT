package com.o4b2.pro.dao;

import java.util.List;
import java.util.Map;

import com.o4b2.pro.dto.ScommentDto;
import com.o4b2.pro.dto.SboardDto;

public interface SboardDao {
	//게시글 목록 구하기
	public List<SboardDto> getList(String hId);
	//게시글 전체 개수 구하기
	public int getBoardCnt(String hId);
	//조회수 증가
	public void viewUpdate(Integer sbnum);
	//게시글 내용(레코드 1행) 가져오기
	public SboardDto getContents(Integer sbnum);
	//게시글 해당 파일 목록 가져오기
	public String getBfListS(Integer sbnum);
	public String getBfListQ(Integer qbnum);
	public String getBfListR(Integer rnum);
	//게시글 해당 댓글 목록 가져오기
	public List<ScommentDto> getReplyList(Integer sbnum);
	//게시글 저장 메소드
	public boolean sboardInsert(SboardDto board);
	//게시글 파일 저장 메소드
	public boolean fileInsert(Map<String, String> fmap);
	//파일 이름 구하기
	public String getfile(Integer sbnum);
	//댓글 저장 메소드
	public boolean replyInsert(ScommentDto reply);
	
	//게시글 수정 메소드
	public boolean sboardUp(SboardDto board);
		
	public boolean boardDelete(int s_num);
	public boolean replyDelete(int s_num);
}
