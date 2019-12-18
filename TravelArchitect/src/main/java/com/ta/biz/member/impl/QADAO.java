package com.ta.biz.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ta.biz.member.QAVO;

@Repository(value="qaDAO")
public class QADAO {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public void insertQA(QAVO vo) {
		mybatis.insert("MemberDAO.inesrtSentMessage", vo);
	}
	public QAVO selectQA(Integer qa_num) {
		return mybatis.selectOne("Admin.selectQA", qa_num);
	}
	public void update() {
		mybatis.update("Admin.update");
	}
}
