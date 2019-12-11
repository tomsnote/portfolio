package com.ta.biz.address.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ta.biz.address.AddressService;
import com.ta.biz.address.AddressVO;

@Service("addressService")
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Override
	public List<AddressVO> selectAddressByDong(String dong) {
		return addressDAO.selectAddressByDong(dong);
	}
}
