package com.ta.view.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ta.biz.flight.FlightService;
import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.MemberService;

@Controller
public class AdminController {
	@Autowired
	private FlightService flightService;
	private MemberService memberService;
	
	@GetMapping(value= "flightManage")
	public String flightManage(Model model, @RequestParam(value="change", required=false, defaultValue="flightList") String change) {
		if(change.equals("seatList")) {
			model.addAttribute("flightSeatList", flightService.getFlightSeatListAdmin());
		} else {
			model.addAttribute("flightList", flightService.getFlightListAdmin());
		}
		model.addAttribute("change", change);
		return "admin/flightManage";
	}
	@GetMapping(value= {"moveInsertSeat", "moveUpdateSeat"})
	public String moveInsertSeat(Model model, FlightVO vo, @RequestParam(value="seatCheck", required=false) boolean seatCheck) {
		if(vo.getFlight()!=null) {
			model.addAttribute("flightName",vo.getFlight());
		} else if(vo.getSeatNum()!=null) {
			model.addAttribute("seat", flightService.selectSeat(vo.getSeatNum()));
		}
		if(seatCheck)
			model.addAttribute("seatCheck", seatCheck);
		
		model.addAttribute("flightList", flightService.getFlightListAdmin());
		return "admin/insertSeat";
	}
	
	@GetMapping(value="insertSeat")
	public String insertSeat(FlightVO vo, RedirectAttributes redirectAttritributes) {
		List<FlightVO> seatList = flightService.getFlightSeatListAdmin();
		for(FlightVO seat : seatList){
			if(seat.getSeatNum().equals(vo.getSeatNum())) {
				redirectAttritributes.addAttribute("seatCheck", true);
				return "redirect:/moveInsertSeat";
			}
		}
		flightService.insertSeat(vo);
		return "redirect:/flightManage";
	}
	
	@GetMapping(value="moveInsertFlight")
	public String moveInsertFlight() {
		return "admin/insertFlight";
	}
	@GetMapping(value="insertFlight")
	public String insertFlight(FlightVO vo) {
		flightService.insertFlight(vo);
		return "redirect:/flightManage";
	}
	
	@GetMapping(value="deleteSeat")
	public String deleteSeat(FlightVO vo) {
		flightService.deleteSeat(vo.getSeatNum());
		return "redirect:/flightManage";
	}
	@GetMapping(value="deleteFlight")
	public String deleteFlight(FlightVO vo) {
		flightService.deleteFlight(vo.getFlight());
		return "redirect:/flightManage";
	}
	
	@GetMapping(value="updateSeat")
	public String updateSeat(FlightVO vo) {
		flightService.updateSeat(vo);
		return "redirect:/flightManage";
	}
	@GetMapping(value="updateFlight")
	public String updateFlight(FlightVO vo) {
		flightService.updateFlight(vo);
		return "redirect:/flightManage";
	}
}
