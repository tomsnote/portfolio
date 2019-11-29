package com.ta.biz.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ta.biz.member.AddressVO;
import com.ta.biz.member.MemberVO;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public MemberVO memberLogin(MemberVO vo) {
		if(vo.getId().equals("")) {
			vo.setId("none");
			return vo;	// ID를 입력하지 않은 경우
		}
		
		MemberVO idCheck = mybatis.selectOne("MemberDAO.memberLoginCheck", vo.getId());
		
		if (idCheck !=null) {
			if (!idCheck.getPwd().equals(vo.getPwd())) {
				return idCheck;	// 비밀번호 틀린 경우
			} else {
				return mybatis.selectOne("MemberDAO.memberLogin", vo);	// 완료
			}
		}
		return idCheck;	// ID가 틀린 경우
	}

	public String checkMember(String id) {
		return mybatis.selectOne("MemberDAO.checkMember", id);
	}

	public List<AddressVO> selectAddressByDong(String dong) {
		return mybatis.selectList("MemberDAO.selectAddressByDong", dong);
	}

	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	public String findId(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.findId", vo);
	}
	
	public String findPwd(String id) {
		return mybatis.selectOne("MemberDAO.findPwd", id);
	}
	
	public void deleteMember(String id) {
		mybatis.delete("MemberDAO.deleteMember", id);
	}
	
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberDAO.updateMember", vo);
	}

}
