package com.o4b2.pro.dao;

import com.o4b2.pro.dto.HospitalDto;
import com.o4b2.pro.dto.MemberDto;

public interface MemberDao {
	
	public String getEncPwd(String id);
	public MemberDto getMemberInfo(String id);
	public void memberInsert(MemberDto member);
	public boolean MemberUpdate(MemberDto member);
	//대환
	public String MsearchId(Integer m_phone);
	public String MsearchPwd(String id);
	public int idCheck(String id);
	public boolean memberDelete(String m_id);
}
