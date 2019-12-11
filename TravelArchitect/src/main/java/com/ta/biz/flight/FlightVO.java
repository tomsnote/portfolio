package com.ta.biz.flight;

import java.sql.Date;

import lombok.Data;

@Data
public class FlightVO {
	//img
	private String path;
	private String img_name;
	
	// flight table
	private String flight;
	private String airline;
	private String departureCity;
	private String arrivalCity;
	private Date departureDate;
	private Date arrivalDate;
	private String departureTime;
	private String arrivalTime;
	private String seatType;
	private String seatNum;
	private Integer flightPrice;
	private String reserve_yn;
	
	// flight resevation 
	private Integer flightReserveCode;
	private String flightReserveName;
	private Date flightReserveDate;
	private Date reserveBirth;
	private String passenger;
	private Date passengerBirth;
	private String gender;
	private String phone;
	private String lname_en;
	private String fname_en;
	private String passport;
	private String flightComment;
	private String id;
	private Integer headCount;
	
	
}
