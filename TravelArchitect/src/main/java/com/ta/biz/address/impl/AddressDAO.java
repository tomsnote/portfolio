package com.ta.biz.address.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ta.biz.address.AddressVO;

@Repository("addressDAO")
public class AddressDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AddressVO> selectAddressByDong(String dong) {
		return mybatis.selectList("MemberDAO.selectAddressByDong", dong);
	}
}
