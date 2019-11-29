package com.ta.biz.flight;

import java.sql.Date;

import lombok.Data;

@Data
public class FlightVO {
	// flight table
	private String flight;
	private String airline;
	private String departureCity;
	private String arrivalCity;
	private Date departureDate;
	private Date arrivalDate;
	private String departureTime;
	private String arrivalTime;
	private String seatCode;
	private String seatType;
	private int seatNum;
	private int flightPrice;
	private String reserveYN;
	
	
	
	// flight resevation 
	private int fReserveCode;
	private String fReserveName;
	private Date fReserveDate;
	private String passport;
	private String fComment;
	private String id;
	
}
