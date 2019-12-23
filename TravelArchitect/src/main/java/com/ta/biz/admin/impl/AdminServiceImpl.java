package com.ta.biz.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ta.biz.admin.AdminService;
import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.MemberVO;
import com.ta.biz.member.QAVO;
import com.ta.biz.page.PageVO;
@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	// flight
	@Override
	public List<FlightVO> getFlightSeatListAdmin() {
		return adminDAO.getFlightSeatListAdmin();
	}
	
	@Override
	public List<FlightVO> getFlightListAdmin() {
		return adminDAO.getFlightListAdmin();
	}
	
	@Override
	public void insertSeat(FlightVO vo) {
		adminDAO.insertSeat(vo);
	}
	@Override
	public void insertFlight(FlightVO vo) {
		adminDAO.insertFlight(vo);
	}

	@Override
	public void deleteSeat(String seatNum) {
		adminDAO.deleteSeat(seatNum);
	}

	@Override
	public void deleteFlight(String flight) {
		adminDAO.deleteFlight(flight);
	}
	
	@Override
	public FlightVO selectSeat(String seatNum) {
		return adminDAO.selectSeat(seatNum);
	}

	@Override
	public void updateSeat(FlightVO vo) {
		adminDAO.updateSeat(vo);
	}

	@Override
	public void updateFlight(FlightVO vo) {
		adminDAO.updateFlight(vo);
	}

	@Override
	public FlightVO moveUpdateFlight(String flight) {
		return adminDAO.moveUpdateFlight(flight);
	}
	
	// member
	@Override
	public Integer count() {
		return adminDAO.count();
	}
	@Override
	public List<MemberVO> selectMember(){
		return adminDAO.selectMember();
	}
	
	// Q&A
	@Override 
	public List<QAVO> selectQA(PageVO vo){
		return adminDAO.selectQA(vo);
	}

	@Override
	public int getQAListCnt() {
		return adminDAO.getQAListCnt();
	}

}
