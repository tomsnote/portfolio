package com.ta.biz.member;

public interface QAService {
	void inesrtSentMessage(QAVO vo);
	QAVO selectQA(Integer qa_num);
	void update();
}
