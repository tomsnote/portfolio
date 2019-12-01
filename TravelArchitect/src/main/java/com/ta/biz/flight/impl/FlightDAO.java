package com.ta.biz.flight.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ta.biz.flight.FlightVO;

@Repository("flightDAO")
public class FlightDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<String> distinctDepartureCities(){
		return mybatis.selectList("FlightDAO.distinctDepartureCities");
	}
	
	public List<String> distinctArrivalCities(String departureCity){
		return mybatis.selectList("FlightDAO.distinctArrivalCities", departureCity);
	}
	
	public List<String> distinctSeatTypes(){
		return mybatis.selectList("FlightDAO.distinctSeatTypes");
	}
	public List<String> possibleDate(FlightVO vo){
		return mybatis.selectList("FlightDAO.possibleDate", vo);
	}
	
	
	public List<FlightVO> getFlights() {
		return mybatis.selectList("FlightDAO.getFlights");
	}
	
	public List<FlightVO> getViewFlight() {
		return mybatis.selectList("FlightDAO.getViewFlight");
	}
	
	public List<FlightVO> searchSchedules(FlightVO vo) {
		return mybatis.selectList("FlightDAO.searchSchedules", vo);
	}
	public List<FlightVO> searchAir(FlightVO vo) {
		return mybatis.selectList("FlightDAO.searchAir", vo);
	}
	public List<FlightVO> distinctAir(FlightVO vo) {
		return mybatis.selectList("FlightDAO.distinctAir", vo);
	}
	
	public List<FlightVO> distinctTime(FlightVO vo) {
		return mybatis.selectList("FlightDAO.distinctTime", vo);
	}
	public FlightVO selectFlight(int code) {
		return mybatis.selectOne("FlightDAO.selectFlight", code);
	}
	
	public FlightVO getFlight(FlightVO vo) {
		return mybatis.selectOne("FlightDAO.getFlight", vo);
	}
}
