package com.o4b2.pro.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QboardDto {
	private int qb_num;
	private String m_id;
	private String qb_title;
	private String qb_contents;
	private Timestamp qb_date;
	private String qb_file;
}
