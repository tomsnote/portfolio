package com.ta.biz.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ta.biz.member.AddressVO;
import com.ta.biz.member.MemberService;
import com.ta.biz.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		return memberDAO.memberLogin(vo);
	}

	@Override
	public String checkMember(String id) {
		return memberDAO.checkMember(id);
	}

	@Override
	public List<AddressVO> selectAddressByDong(String dong) {
		return memberDAO.selectAddressByDong(dong);
	}

	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}

	@Override
	public String findId(MemberVO vo) {
		return memberDAO.findId(vo);
	}

	@Override
	public String findPwd(String id) {
		return memberDAO.findPwd(id);
	}

	@Override
	public void deleteMember(String id) {
		memberDAO.deleteMember(id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}



}
