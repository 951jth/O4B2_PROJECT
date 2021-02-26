package com.o4b2.pro.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ScommentDto {
	private int sc_num;
	private int sb_num;
	private String m_id;
	private String sc_board;
	private Timestamp sc_date;
}
