package com.o4b2.pro.dao;

import java.util.List;
import java.util.Map;

import com.o4b2.pro.dto.DScheduleDto;
import com.o4b2.pro.dto.MedicalDto;
import com.o4b2.pro.dto.PrescriptionDto;

public interface MedicalDao {
	//병원 id 가져오기
	public String getHosId(String hosName);
	//병원 name 가져오기
	public List<String> getHosName(String hosId);
	//예약 등록
	public boolean medIn(MedicalDto me);
	//예약목록 가져오기
	public List<MedicalDto> getComMedi(String mId);
	public List<MedicalDto> getMedi(String mId);
	//병원예약목록 가져오기
	public List<MedicalDto> hgetComMedi(String hId);
	public List<MedicalDto> hgetMedi(String hId);
	//의사 id 가져오기
	public int getDocId(Map<String, String> docNumSel);
	//의사 name 가져오기
	public List<String> getDocName(int docNum);
	//병원 진료과 가져오기
    public String getMajor(String hId);
    //의사 list 가져오기
    public List<String> getDocList(String hId);
    
    /*세훈*/
    //의사 번호 
	public List<Integer> getD_num(String hId);
	//의사번호로 의사이름을 가져오는 메소드
	public String getDName(int d_num);
	//의사번호와 이름을 가져오는 메소드임
	public List<MedicalDto> getDList(String hId);
	//진료삭제 메소드
	public boolean deleteMedi(int me_num);
	//진료완료 처리 메소드
	public boolean rPermit(int me_num);
	//진료거부 처리 메소드
	public boolean refuseProc(MedicalDto medi);
	
	public PrescriptionDto getPreInfo(int me_num);
	//추가 (정훈)
	public String getDocName2(int a);
	
	//의사 스케줄 저장
	public boolean setSchedule(DScheduleDto ds);
	public int getMeSeq();
	public int getDsSeq();
}
