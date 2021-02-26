package com.o4b2.pro.dto;
import lombok.Data;

@Data
public class MedicalDto {
	private int me_num;
	private String m_id;
	private String h_id;
	private int d_num;
	private String m_date;
	private String m_phone;
	private String me_name;
	private String me_major;
	private String d_name;
	private String me_pattern;
	private String me_creason;
	private String me_text;
	//db데이터가져올 이름맞쳐주기
	private String me_dname;
	private int me_time;
}
