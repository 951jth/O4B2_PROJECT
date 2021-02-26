package com.o4b2.pro.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PrescriptionDto {
	private int p_num;
	private String h_id;
	private String m_id;
	private int d_num;
	private int me_num;
	private String p_visit;
	private String p_major;
	//@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private String p_date;
	private String p_mcomment;
	private String p_comment;
	private String p_hname;
	private String p_image;
	private String p_dname;
}