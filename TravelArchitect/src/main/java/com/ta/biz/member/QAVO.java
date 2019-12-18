package com.ta.biz.member;

import java.sql.Date;

import lombok.Data;

@Data
public class QAVO {
	private Integer qa_num;
	private String title;
	private String name;
	private String phone;
	private String email;
	private String context;
	private Date regdate;
	private String answer;
	private String member;
}
