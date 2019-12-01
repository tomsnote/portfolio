package com.ta.view.page;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ta.biz.flight.FlightService;
import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.MemberVO;

@Controller
@SessionAttributes("reserve")
public class PageController {

	@Autowired
	private FlightService flightService;

	@RequestMapping(value = { "/", "index" }, method = RequestMethod.GET)
	public String home() {
		return "index";
	}

	@RequestMapping(value = "about", method = RequestMethod.GET)
	public String about() {
		return "about";
	}

	@RequestMapping(value = { "mypage", "airList", "hotelList" }, method = RequestMethod.GET)
	public String mypage(@RequestParam(value = "change", required = false, defaultValue = "airList") String changeList,
			@SessionAttribute(value = "loginMember", required = false) MemberVO session, Model model) {
		if (session != null) {
			model.addAttribute("reserveList", flightService.getViewFlight());

			if (!changeList.equals("airList"))
				changeList = "hotelList";
			else
				changeList = "airList";
			model.addAttribute("changeList", changeList);

			return "page/mypage";
		} else {
			return "member/login";
		}
	}

	@RequestMapping(value = "airReserve", method = RequestMethod.GET)
	public String airReserve(FlightVO vo, Model model, String departureCity, String arrivalCity) {
		model.addAttribute("distinctSeatTypes", flightService.distinctSeatTypes());
		model.addAttribute("distinctDepartureCities", flightService.distinctDepartureCities());
		model.addAttribute("distinctArrivalCities", flightService.distinctArrivalCities(departureCity));
		if (vo.getDepartureCity() != null && vo.getArrivalCity() != null) {
			model.addAttribute("possibleDate", flightService.possibleDate(vo));
		}
		model.addAttribute("depart", departureCity);
		model.addAttribute("arrival", arrivalCity);
		return "page/airReserve";
	}

	@RequestMapping(value = "airSchedules", method = RequestMethod.GET)
	public String airShcedules(FlightVO vo, Model model,
			@SessionAttribute(value = "reserve", required = false) FlightVO session) {
		if (session == null) {// 세션이 없을 경우
			model.addAttribute("reserve", vo);
		} else {// 세션이 있고 departureCity가 있을 때 session에 vo 값을 넣어줌
			if (vo.getDepartureCity() != null) {
				session.setDepartureCity(vo.getDepartureCity());
				session.setArrivalCity(vo.getArrivalCity());
				session.setSeatType(vo.getSeatType());
				session.setDepartureDate(vo.getDepartureDate());
				model.addAttribute("reserve", session); // session 갱신
			} else if (vo.getAirline() != null || vo.getDepartureTime() != null) { // vo.airline 값이 있으면
				vo.setDepartureCity(session.getDepartureCity());
				vo.setArrivalCity(session.getArrivalCity());
				vo.setSeatType(session.getSeatType());
				vo.setDepartureDate(session.getDepartureDate());
			}

		}
		
		try {
			model.addAttribute("flights", flightService.searchSchedules(vo));
			model.addAttribute("distinctAir", flightService.distinctAir(vo));
			model.addAttribute("distinctTime", flightService.distinctTime(vo));
			model.addAttribute("airline", vo.getAirline());
			model.addAttribute("time", vo.getDepartureTime());
			model.addAttribute("info", vo);
			return "page/airSchedules";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/airReserve";
		}
	}
	
	
	@RequestMapping(value="selectReserve", method=RequestMethod.GET)
	public String selectReserve(FlightVO vo, Model model, @SessionAttribute("reserve") FlightVO session) {
		model.addAttribute("flight",flightService.getFlight(vo));
		return "page/reserve";
	}

}
