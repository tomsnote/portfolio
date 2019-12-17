package com.ta.biz.admin;

import java.util.List;

import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.MemberVO;
import com.ta.biz.qa.QAVO;

public interface AdminService {
	// flight
	List<FlightVO> getFlightSeatListAdmin();
	List<FlightVO> getFlightListAdmin();
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
	List<QAVO> selectQA();
}
