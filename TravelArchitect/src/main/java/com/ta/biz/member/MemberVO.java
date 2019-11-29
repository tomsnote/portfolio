package com.ta.biz.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pwd;
	private String fname_ko;
	private String lname_ko;
	private String fname_en;
	private String lname_en;
	private String nationality;
	private Date birth;
	private String gender;
	private String address;
	private String email;
	private String phone;
	private String useyn;
	private Date regDate;
	private String authority;
	
}
