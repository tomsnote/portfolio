package com.ta.biz.flight.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ta.biz.flight.FlightService;
import com.ta.biz.flight.FlightVO;

@Service("flightService")
public class FlightServiceImpl implements FlightService {
	@Autowired
	private FlightDAO flightDAO;
	
	@Override
	public List<String> distinctDepartureCities() {
		return flightDAO.distinctDepartureCities();
	}

	@Override
	public List<String> distinctArrivalCities(String departureCity) {
		return flightDAO.distinctArrivalCities(departureCity);
	}
	@Override
	public List<String> distinctSeatTypes() {
		return flightDAO.distinctSeatTypes();
	}
	@Override
	public List<String> possibleDate(FlightVO vo) {
		return flightDAO.possibleDate(vo);
	}
	
	@Override
	public List<FlightVO> getViewFlight() {
		return flightDAO.getViewFlight();
	}

	@Override
	public List<FlightVO> getFlights() {
		return flightDAO.getFlights();
	}

	@Override
	public List<FlightVO> searchSchedules(FlightVO vo) {
		return flightDAO.searchSchedules(vo);
	}

	@Override
	public List<FlightVO> searchAir(FlightVO vo) {
		return flightDAO.searchAir(vo);
	}

	@Override
	public List<FlightVO> distinctAir(FlightVO vo) {
		return flightDAO.distinctAir(vo);
	}

	@Override
	public List<FlightVO> distinctTime(FlightVO vo) {
		return flightDAO.distinctTime(vo);
	}

	@Override
	public FlightVO selectFlight(int code) {
		return flightDAO.selectFlight(code);
	}

	

	

	

	

}
