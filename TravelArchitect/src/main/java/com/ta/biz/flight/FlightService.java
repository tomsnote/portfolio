package com.ta.biz.flight;

import java.util.List;

public interface FlightService {
	// index img
	List<FlightVO> image();
	
	// airReserve.jsp
	List<String> distinctDepartureCities();
	List<String> distinctArrivalCities(String departureCity);
	List<String> distinctSeatTypes();
	List<String> possibleDate(FlightVO vo);
	
	FlightVO getFlight(FlightVO vo);
	List<FlightVO> getFlights(FlightVO vo);
	void insertReserveFlightGuest(FlightVO vo);
	void insertReserveFlight(FlightVO vo);
	
	
	// airSchedules.jsp
	List<FlightVO> searchSchedules(FlightVO vo);
	List<FlightVO> searchAir(FlightVO vo);
	List<FlightVO> distinctAir(FlightVO vo);
	List<FlightVO> distinctTime(FlightVO vo);
	
	// airList.jsp
	List<FlightVO> getViewFlights();
	List<FlightVO> getViewFlightsGuest(String flightReserveName);
	void updateReserveSeatY(String seatNum);
	void updateReserveSeatN(Integer code);
	void deleteReserve(Integer cseq);
	void updateCancelSeat(Integer cseq);
	FlightVO checkReserve(Integer cseq);
	void updateReserve(FlightVO vo);
	
	
	// findReserve
	List<FlightVO> findCallReserve(String name);
	
	
	
}