package com.o4b2.pro.dao;

import java.util.List;
import java.util.Map;

import com.o4b2.pro.dto.QboardDto;
import com.o4b2.pro.dto.QcommentDto;

public interface QboardDao {
	//게시글 목록 구하기
	public List<QboardDto> getList(int pageNum);
	//게시글 전체 개수 구하기
	public int getBoardCnt();
	//게시글 저장 메소드
	public boolean qboardInsert(QboardDto board);
	//게시글 파일 저장 메소드
	public boolean fileInsert(Map<String, String> fmap);
	//게시글 내용(레코드 1행) 가져오기
	public QboardDto getContents(Integer qbnum);
	//게시글 해당 파일 목록 가져오기
	public String getBfListQ(Integer qbnum);
	//게시글 해당 댓글 목록 가져오기
	public List<QcommentDto> getReplyList(Integer qbnum);
	//댓글 저장 메소드
	public boolean replyInsert(QcommentDto reply);
	//파일 이름 구하기
	public String getfile(Integer sbnum);
	//게시글 및 댓글삭제
	public boolean replyDelete(int q_num);
	public boolean boardDelete(int q_num);
	//게시글수정
	public boolean qboardUp(QboardDto board);
}
