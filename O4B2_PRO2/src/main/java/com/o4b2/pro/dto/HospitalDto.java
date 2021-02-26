package com.o4b2.pro.dto;

import lombok.Data;

@Data
public class HospitalDto {
	private String h_id;
	private String h_pwd;
	private String h_repre;//대표이름
	private String h_name;//병원이름
	private int h_crn;//병원사번 
	private String h_image;//병원이미지
	private String h_reg;//병원등록증
	private String h_addr;//병원주소
	private String h_major;//진료과목
	private int h_cn;//병원법인번호 
	private String h_call;
	
	/*진료과목*/
	
}
