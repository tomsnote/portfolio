package com.ta.biz.admin;

import java.util.List;

import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.MemberVO;
import com.ta.biz.member.QAVO;
import com.ta.biz.page.PageVO;

public interface AdminService {
	// flight
	int getSeatListCnt();
	List<FlightVO> getFlightSeatListAdmin(PageVO vo);
	int getFlightListCnt();
	List<FlightVO> getFlightListAdmin(PageVO vo);
	List<FlightVO> getFlightSeatCheck();
	void insertSeat(FlightVO vo);
	void insertFlight(FlightVO vo);
	void deleteSeat(String seatNum);
	void deleteFlight(String flight);
	FlightVO selectSeat(String seatNum);
	void updateSeat(FlightVO vo);
	void updateFlight(FlightVO vo);
	FlightVO moveUpdateFlight(String flight);
	
	// member
	Integer count();
	List<MemberVO> selectMember();
	
	// Q&A
	List<QAVO> getQAList(PageVO vo);
	int getQAListCnt();
	
}
