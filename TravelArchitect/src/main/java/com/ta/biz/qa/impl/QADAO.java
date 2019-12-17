package com.ta.biz.qa.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ta.biz.qa.QAVO;

@Repository(value="qaDAO")
public class QADAO {
	@Autowired 
	private SqlSessionTemplate mybatis;
	
	public void insertQA(QAVO vo) {
		mybatis.insert("Admin.insertQA", vo);
	}
}
