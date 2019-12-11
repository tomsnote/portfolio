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
	public List<FlightVO> image() {
		return flightDAO.image();
	}

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
	public List<FlightVO> getViewFlights() {
		return flightDAO.getViewFlights();
	}
	@Override
	public List<FlightVO> getViewFlightsGuest(String flightReserveName) {
		return flightDAO.getViewFlightsGuest(flightReserveName);
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
	public FlightVO getFlight(FlightVO vo) {
		return flightDAO.getFlight(vo);
	}
	
	@Override
	public List<FlightVO> getFlights(FlightVO vo) {
		return flightDAO.getFlights(vo);
	}

	@Override
	public void insertReserveFlightGuest(FlightVO vo) {
		flightDAO.insertReserveFlightGuest(vo);
	}
	@Override
	public void insertReserveFlight(FlightVO vo) {
		flightDAO.insertReserveFlight(vo);
	}

	@Override
	public void updateReserveSeatY(String seatNum) {
		flightDAO.updateReserveSeatY(seatNum);
	}
	@Override
	public void updateReserveSeatN(Integer code) {
		flightDAO.updateReserveSeatN(code);
	}

	@Override
	public void deleteReserve(Integer cseq) {
		flightDAO.deleteReserve(cseq);
	}

	@Override
	public void updateCancelSeat(Integer cseq) {
		flightDAO.updateCancelSeat(cseq);
	}
	@Override
	public void updateReserve(FlightVO vo) {
		flightDAO.updateReserve(vo);
	}
	


	@Override
	public List<FlightVO> findCallReserve(String name) {
		return flightDAO.findCallReserve(name);
	}

	@Override
	public FlightVO checkReserve(Integer cseq) {
		return flightDAO.checkReserve(cseq);
	}

	
	

	

	

	

}
