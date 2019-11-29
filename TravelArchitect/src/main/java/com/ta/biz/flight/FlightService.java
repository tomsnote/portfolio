package com.ta.biz.flight;

import java.util.List;

public interface FlightService {
	List<String> distinctDepartureCities();
	List<String> distinctArrivalCities(String departureCity);
	List<String> distinctSeatTypes();
	List<String> possibleDate(FlightVO vo);
	
	List<FlightVO> getFlights();
	List<FlightVO> searchSchedules(FlightVO vo);
	List<FlightVO> searchAir(FlightVO vo);
	List<FlightVO> distinctAir(FlightVO vo);
	List<FlightVO> distinctTime(FlightVO vo);
	FlightVO selectFlight(int code);
	
	List<FlightVO> getViewFlight();

}