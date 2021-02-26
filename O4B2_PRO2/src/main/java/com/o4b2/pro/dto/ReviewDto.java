package com.o4b2.pro.dto;

import java.security.Timestamp;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewDto {
	private int r_num;
	private String m_id;
	private int me_num;
	private String r_contents;
	private String r_image;
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Timestamp r_date;
	private int r_star;
	private int r_like;
	private String h_name;
	private String d_name;
	private String r_title;
}
