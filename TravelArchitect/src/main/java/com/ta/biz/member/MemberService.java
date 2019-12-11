package com.ta.biz.member;

import java.util.List;

import com.ta.biz.address.AddressVO;

public interface MemberService {

	MemberVO memberLogin(MemberVO vo);
	String checkMember(String id);
	void insertMember(MemberVO vo);
	String findId(MemberVO vo);
	String findPwd(String id);
	void deleteMember(String id);
	void updateMember(MemberVO vo);
}