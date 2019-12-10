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
	List<FlightVO> getViewFlightsGuest();
	void updateReserveSeatY(String seatNum);
	void updateReserveSeatN(Integer code);
	void deleteReserve(Integer cseq);
	void updateCancelSeat(Integer cseq);
	FlightVO checkReserve(Integer cseq);
	void updateReserve(FlightVO vo);
	
	// adimn
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
}