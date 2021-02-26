package com.o4b2.pro.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QcommentDto {
	private int qbc_num;
	private String m_id;
	private String qbc_comment;
	private Timestamp qbc_date;
	private int qb_num;
}
