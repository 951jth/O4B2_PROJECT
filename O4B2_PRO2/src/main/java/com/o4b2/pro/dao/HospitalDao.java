package com.o4b2.pro.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.o4b2.pro.dto.DScheduleDto;
import com.o4b2.pro.dto.DoctorDto;
import com.o4b2.pro.dto.HospitalDto;

public interface HospitalDao {
	public HospitalDto getHospitalInfo(String id);
	public String getHPwd(String id);
	public boolean HospitalInsert(HospitalDto hos);
	public boolean HospitalUpdate(HospitalDto hospital);
	public boolean fileInsert(Map<String, String> fmap);
	public boolean regInsert(Map<String, String> fmap);
	public boolean insertDoctor(DoctorDto doctor);
	public boolean doctorImgInsert(Map<String, String> dmap);
	public List<HospitalDto> getHospital(String hos);
	public List<HospitalDto> getHosMajor(String hos);
	//대환
	public String HosSearchId(Integer h_cn);
	public String HosSearchPwd(String id);
	//정훈
	public List<DScheduleDto> getSchedule(int d_num);
	public int getDnum(@Param("doc")String doc, @Param("hId")String hId);
	//진료예약번호 -> 진료예약환자ID -> 환자이름  
	public String getMid(int meNum);
	public String getMname(String mId);
	public List<DoctorDto> getDoctor(String hId);
	public int idCheck(String id);
	public void deleteDoctor(int d_num);
}
