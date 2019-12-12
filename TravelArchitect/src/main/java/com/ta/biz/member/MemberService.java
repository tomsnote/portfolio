package com.ta.biz.member;

public interface MemberService {

	MemberVO memberLogin(MemberVO vo);
	String checkMember(String id);
	void insertMember(MemberVO vo);
	String findId(MemberVO vo);
	String findPwd(String id);
	void deleteMember(String id);
	void updateMember(MemberVO vo);
}