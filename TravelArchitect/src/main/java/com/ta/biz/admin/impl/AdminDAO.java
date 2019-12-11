package com.ta.biz.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ta.biz.flight.FlightVO;
@Repository("adminDAO")
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// admin
		public List<FlightVO> getFlightSeatListAdmin(){
			return mybatis.selectList("Admin.getFlightSeatListAdmin");
		}
		public List<FlightVO> getFlightListAdmin(){
			return mybatis.selectList("Admin.getFlightListAdmin");
		}
		public void insertSeat(FlightVO vo) {
			mybatis.insert("Admin.insertSeat",vo);
		}
		public void insertFlight(FlightVO vo) {
			mybatis.insert("Admin.insertFlight",vo);
		}
		public void deleteSeat(String seatNum) {
			mybatis.delete("Admin.deleteSeat",seatNum);
		}
		public void deleteFlight(String flight) {
			mybatis.delete("Admin.deleteFlight",flight);
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
}
