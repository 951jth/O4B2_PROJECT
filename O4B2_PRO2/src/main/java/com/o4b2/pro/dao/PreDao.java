package com.o4b2.pro.dao;

import java.util.List;
import java.util.Map;

import com.o4b2.pro.dto.HospitalDto;
import com.o4b2.pro.dto.MedicalDto;
import com.o4b2.pro.dto.PrescriptionDto;

public interface PreDao {
	public MedicalDto selectMInfo(int me_num);
	public String getHosDname(String id);
	public boolean insertPre(PrescriptionDto pre);
	public boolean fileInsert(Map<String, String> fmap);
	public List<PrescriptionDto> selectPInfo(String m_id);
	public List<PrescriptionDto> selectPHos(String h_id);
	public PrescriptionDto preSelect(int me_num);
	public int getPreCnt();
	public boolean deletePre(int p_num);
}
