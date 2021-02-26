package com.o4b2.pro.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SboardDto {	
	private int sb_num;
	private String m_id;
	private String sb_file; 
	private String sb_name;
	private String h_id;
	private Timestamp sb_date;
	private String sb_pwd;
	private int sb_power;
	private int sb_view;
	private String sb_comment;

}
