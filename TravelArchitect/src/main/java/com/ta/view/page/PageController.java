package com.ta.view.page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ta.biz.flight.FlightService;
import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.MemberVO;
import com.ta.biz.qa.QAVO;

@Controller
@SessionAttributes(value = "reserveList")
public class PageController {

	@Autowired
	private FlightService flightService;

	// ����¡ �޼ҵ�
	public void paging(String pageName) {
		int totalCount;
	}
	
	@GetMapping(value = { "/", "index" })
	public String home(@SessionAttribute(value = "adminUser", required = false) MemberVO adminUser, Model model) {
		model.addAttribute("images", flightService.image());
		if (adminUser != null)
			return "admin/managerHome";

		return "index";
	}

	@GetMapping(value = "about")
	public String about() {
		return "about";
	}

	@GetMapping(value = "mypage")
	public String mypage(@RequestParam(value = "change", required = false, defaultValue = "airList") String change,
			@SessionAttribute(value = "loginMember", required = false) MemberVO member,
			@SessionAttribute(value="guest", required = false) FlightVO guest, Model model) {
		List<FlightVO> reserveList = null;
		if(member!=null) {	// ȸ��, ��ȸ�� ����
			reserveList = flightService.getViewFlights();
		} else if(guest!=null){
			reserveList = flightService.getViewFlightsGuest(guest.getFlightReserveName());
		}
		
		if (!change.equals("airList")) {
			change = "hotelList";
		} else {
			change = "airList";
		}
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("change", change);
		return "member/mypage";
	}
	
	@GetMapping(value="customerService")
	public String customerService() {
		return "page/contact";
	}
	
	@PostMapping(value="sentMessage")
	public String sentMessage(QAVO vo) {
		
		return "page/contact";
	}
}
