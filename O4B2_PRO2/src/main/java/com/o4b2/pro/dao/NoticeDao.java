package com.o4b2.pro.dao;

import java.util.List;
import java.util.Map;

import com.o4b2.pro.dto.NoticeDto;

public interface NoticeDao {
	public List<NoticeDto> getNList(String m_id);
	public boolean insertN(NoticeDto nDto);
	public boolean fileInsert(Map<String, String> fmap);
	public NoticeDto getNotice(int n_num);
	public boolean nViewUp(int n_num);
	public String nfList(int n_num);
	public String getfile(int n_num);
	public boolean nUpdate(NoticeDto nDto);
	public boolean deleteN(int n_num);

}
