package com.ta.view.reserve;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ta.biz.flight.FlightService;
import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.MemberVO;

@Controller
@SessionAttributes(value= {"reserve", "guest"})
public class FlightController {

	@Autowired
	private FlightService flightService;


	@GetMapping(value = "airReserve")
	public String airReserve(FlightVO vo, Model model, String departureCity, String arrivalCity) {
		model.addAttribute("distinctSeatTypes", flightService.distinctSeatTypes());
		model.addAttribute("distinctDepartureCities", flightService.distinctDepartureCities());
		model.addAttribute("distinctArrivalCities", flightService.distinctArrivalCities(departureCity));
		if (vo.getDepartureCity() != null && vo.getArrivalCity() != null) {
			model.addAttribute("possibleDate", flightService.possibleDate(vo));
			System.out.println(flightService.possibleDate(vo));
		}
		model.addAttribute("depart", departureCity);
		model.addAttribute("arrival", arrivalCity);
		return "flight/airReserve";
	}

	@GetMapping(value = "airSchedules")
	public String airShcedules(FlightVO vo, Model model,
			@SessionAttribute(value = "reserve", required = false) FlightVO session) {
		if (session == null) {
			// reserve session�� ���� ���
			model.addAttribute("reserve", vo);
		} else {
			if (vo.getDepartureCity() != null) {
				// ������ �ְ� departureCity�� ���� �� session�� vo ���� set��
				session.setDepartureCity(vo.getDepartureCity());
				session.setArrivalCity(vo.getArrivalCity());
				session.setSeatType(vo.getSeatType());
				session.setDepartureDate(vo.getDepartureDate());
				model.addAttribute("reserve", session); // update session
			} else if (vo.getAirline() != null || vo.getDepartureTime() != null) {
				// �װ���� ��߽ð��� �������� session�ǰ��� vo�� set��
				vo.setDepartureCity(session.getDepartureCity());
				vo.setArrivalCity(session.getArrivalCity());
				vo.setSeatType(session.getSeatType());
				vo.setDepartureDate(session.getDepartureDate());
			}

		}
		
		try {
			model.addAttribute("flights", flightService.searchSchedules(vo));	// �װ��� ����Ʈ
			model.addAttribute("distinctAir", flightService.distinctAir(vo));	// �װ��� ���� ����Ʈ
			model.addAttribute("distinctTime", flightService.distinctTime(vo));	// ��߽ð� ���� ����Ʈ
			// ���� �������� ��û���� ������ ��
			model.addAttribute("airline", vo.getAirline());
			model.addAttribute("time", vo.getDepartureTime());
			model.addAttribute("info", vo);
			return "flight/airSchedules";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/airReserve";
		}
	}
	
	
	@GetMapping(value= {"selectReserve", "checkReserve"})
	public String selectReserve(FlightVO vo, Model model,
			@RequestParam(value="cseq", required=false) Integer cseq) {
		FlightVO flight = null;
		if(cseq!=null) {
			flight = flightService.checkReserve(cseq);
		}else {
			flight = flightService.getFlight(vo);
		}
		model.addAttribute("flight", flight);
		return "flight/reserve";
	}
	
	@GetMapping(value="reserve")
	public String reserve(FlightVO vo, Model model,@SessionAttribute(value="loginMember", required=false) MemberVO loginMember) {
		// �װ��� reserve�� ����
		FlightVO reserve = flightService.getFlight(vo);
		// ������ ���� �Է�
		reserve.setFlightReserveName(vo.getFlightReserveName());
		reserve.setFlightReserveBirth(vo.getFlightReserveBirth());
		reserve.setFlightReservePhone(vo.getFlightReservePhone());
		reserve.setFlightReserveEmail(vo.getFlightReserveEmail());
		// ž���� ���� �Է�
		reserve.setPassport(vo.getPassport());
		reserve.setPassenger(vo.getPassenger());
		reserve.setLname_en(vo.getLname_en());
		reserve.setFname_en(vo.getFname_en());
		reserve.setPassengerBirth(vo.getPassengerBirth());
		reserve.setGender(vo.getGender());
		reserve.setPassengerPhone(vo.getPassengerPhone());
		reserve.setFlightComment(vo.getFlightComment());
		
		if(loginMember!=null) {	
			reserve.setMember(loginMember.getId());	// ȸ���� ��, �����ڿ� ȸ�� ID SET
			flightService.insertReserveFlight(reserve);
		} else {
			flightService.insertReserveFlightGuest(reserve);
			model.addAttribute("guest", reserve);
		}
		flightService.updateReserveSeatY(reserve.getSeatNum());
		return "redirect:/mypage";
	}
	
	@GetMapping(value="findReserve")
	public String findCallReserve(FlightVO vo, Model model) {
		int message=0;
		if(vo.getFlightReserveName()!=null) {
			message=-1;
			List<FlightVO> reserveList = flightService.findCallReserve(vo.getFlightReserveName());
			for(FlightVO list: reserveList) {
				if(vo.getFlightReserveName().equals(list.getFlightReserveName())) {
					message=1;
					model.addAttribute("flightReserveName", list.getFlightReserveName());
				}
			}
		}
		model.addAttribute("message",message);
		return "flight/findReserve";
	}
	@GetMapping(value="callReserve")
	public String callReserve(FlightVO vo, Model model) {
		model.addAttribute("guest", vo);
		return "redirect:/mypage";
	}
	
	@GetMapping(value="deleteReserve")
	public String deleteReserve(@RequestParam(value="cseq") List<Integer> cseq) {
		for(Integer code: cseq) {
			flightService.updateReserveSeatN(code);
			flightService.deleteReserve(code);
		}
		return "redirect:/mypage";
	}
	
	@GetMapping(value="updateReserve")
	public String updateReserve(FlightVO vo, Model model) {
		model.addAttribute("guest", vo);
		flightService.updateReserve(vo);
		return "redirect:/mypage";
	}

}
