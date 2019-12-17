package com.ta.biz.qa.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ta.biz.qa.QAService;
import com.ta.biz.qa.QAVO;

@Service(value="qaService")
public class QAServiceImple implements QAService {

	@Autowired
	private QADAO qaDAO;
	
	@Override
	public void insertQA(QAVO vo) {
		qaDAO.insertQA(vo);
	}

}
