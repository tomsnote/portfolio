package com.ta.biz.flight;

import java.sql.Date;

import lombok.Data;

@Data
public class FlightVO {
	// img
	private Integer code;
	private String path;
	private String name;
	private String page;

	// flight table
	private String flight;
	private String airline;
	private String departureCity;
	private String arrivalCity;
	private Date departureDate;
	private Date arrivalDate;
	private String departureTime;
	private String arrivalTime;
	
	// seat table
	private String seatType;
	private String seatNum;
	private Integer flightPrice;
	private String reserve_yn;

	// flight_reserve table
	private Integer flightReserveCode;
	private String flightReserveName;
	private Date flightReserveBirth;
	private String flightReservePhone;
	private String flightReserveEmail;
	private Date flightReserveDate;
	
	// passenger
	private String passport;
	private String passenger;
	private String lname_en;
	private String fname_en;
	private Date passengerBirth;
	private String gender;
	private String passengerPhone;
	private String flightComment;
	private Integer headCount;
	private String member;	// ȸ�� Ȯ����

}
