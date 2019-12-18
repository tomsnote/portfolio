package com.ta.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ta.biz.member.QAService;
import com.ta.biz.member.QAVO;

@Service(value="qaService")
public class QAServiceImple implements QAService {

	@Autowired
	private QADAO qaDAO;
	
	@Override
	public void inesrtSentMessage(QAVO vo) {
		qaDAO.insertQA(vo);
	}

	@Override
	public QAVO selectQA(Integer qa_num) {
		return qaDAO.selectQA(qa_num);
	}

	@Override
	public void update() {
		qaDAO.update();
	}

}
