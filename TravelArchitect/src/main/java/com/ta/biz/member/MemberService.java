package com.ta.biz.member;

import java.util.List;

public interface MemberService {

	MemberVO memberLogin(MemberVO vo);
	String checkMember(String id);
	List<AddressVO> selectAddressByDong(String dong);
	void insertMember(MemberVO vo);
	String findId(MemberVO vo);
	String findPwd(String id);
	void deleteMember(String id);
	void updateMember(MemberVO vo);
}