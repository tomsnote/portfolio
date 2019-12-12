package com.ta.biz.flight;

import java.sql.Date;

import lombok.Data;

@Data
public class FlightVO {
	// img
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
	
	// ÁÂ¼®
	private String seatType;
	private String seatNum;
	private Integer flightPrice;
	private String reserve_yn;

	// flight ¿¹¾àÀÚ
	private Integer flightReserveCode;
	private String flightReserveName;
	private Date flightReserveBirth;
	private String flightReservePhone;
	private String flightReserveEmail;
	private Date flightReserveDate;
	
	// Å¾½Â°´
	private String passport;
	private String passenger;
	private String lname_en;
	private String fname_en;
	private Date passengerBirth;
	private String gender;
	private String passengerPhone;
	private String flightComment;
	private Integer headCount;
	private String member;	// È¸¿ø È®ÀÎÀÚ

}
