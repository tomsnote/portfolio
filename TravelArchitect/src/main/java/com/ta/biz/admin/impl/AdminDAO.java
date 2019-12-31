package com.ta.biz.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.MemberVO;
import com.ta.biz.member.QAVO;
import com.ta.biz.page.PageVO;

@Repository("adminDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// admin
	public int getSeatListCnt() {
		return mybatis.selectOne("Admin.getSeatListCnt");
	}
	public List<FlightVO> getFlightSeatListAdmin(PageVO vo) {
		return mybatis.selectList("Admin.getFlightSeatListAdmin", vo);
	}
	public int getFlightListCnt() {
		return mybatis.selectOne("Admin.getFlightListCnt");
	}
	public List<FlightVO> getFlightListAdmin(PageVO vo) {
		return mybatis.selectList("Admin.getFlightListAdmin", vo);
	}

	public List<FlightVO> getFlightSeatCheck(){
		return mybatis.selectList("Admin.getFlightSeatCheck");
	}
	public void insertSeat(FlightVO vo) {
		mybatis.insert("Admin.insertSeat", vo);
	}

	public void insertFlight(FlightVO vo) {
		mybatis.insert("Admin.insertFlight", vo);
	}

	public void deleteSeat(String seatNum) {
		mybatis.delete("Admin.deleteSeat", seatNum);
	}

	public void deleteFlight(String flight) {
		mybatis.delete("Admin.deleteFlight", flight);
	}

	public FlightVO selectSeat(String seatNum) {
		return mybatis.selectOne("Admin.selectSeat", seatNum);
	}

	public void updateSeat(FlightVO vo) {
		mybatis.update("Admin.updateSeat", vo);
	}

	public void updateFlight(FlightVO vo) {
		mybatis.update("Admin.updateFlight", vo);
	}

	public FlightVO moveUpdateFlight(String flight) {
		return mybatis.selectOne("Admin.moveUpdateFlight", flight);
	}

	// member
	public Integer count() {
		return mybatis.selectOne("Admin.count");
	}

	public List<MemberVO> selectMember() {
		return mybatis.selectList("Admin.selectMember");
	}

	// Q&A
	public List<QAVO> getQAList(PageVO vo) {
		return mybatis.selectList("Admin.getQAList", vo);
	}

	public int getQAListCnt() {
		return mybatis.selectOne("Admin.getQAListCnt");
	}
}
