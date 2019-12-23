package com.ta.view.admin;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ta.biz.admin.AdminService;
import com.ta.biz.flight.FlightVO;
import com.ta.biz.member.QAService;
import com.ta.biz.member.QAVO;
import com.ta.biz.page.PageVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private QAService qaService;
	
	@GetMapping(value= "flightManage")
	public String flightManage(Model model, @RequestParam(value="change", required=false, defaultValue="flightList") String change) {
		
		if(change.equals("seatList")) {
			model.addAttribute("flightSeatList", adminService.getFlightSeatListAdmin());
		} else {
//			flightService.getTotalCount();
			model.addAttribute("flightList", adminService.getFlightListAdmin());
		}
		model.addAttribute("change", change);
		return "admin/flightManage";
	}
	@GetMapping(value= {"moveInsertSeat", "moveUpdateSeat"})
	public String moveInsertSeat(Model model, FlightVO vo, @RequestParam(value="seatCheck", required=false) boolean seatCheck) {
		if(vo.getFlight()!=null) {
			model.addAttribute("flightName",vo.getFlight());
		} else if(vo.getSeatNum()!=null) {
			model.addAttribute("seat", adminService.selectSeat(vo.getSeatNum()));
		}
		if(seatCheck)
			model.addAttribute("seatCheck", seatCheck);
		
		model.addAttribute("flightList", adminService.getFlightListAdmin());
		return "admin/insertSeat";
	}
	
	@GetMapping(value="insertSeat")
	public String insertSeat(FlightVO vo, RedirectAttributes redirectAttritributes) {
		List<FlightVO> seatList = adminService.getFlightSeatListAdmin();
		for(FlightVO seat : seatList){
			if(seat.getSeatNum().equals(vo.getSeatNum())) {
				redirectAttritributes.addAttribute("seatCheck", true);
				return "redirect:/moveInsertSeat";
			}
		}
		adminService.insertSeat(vo);
		return "redirect:/flightManage";
	}
	
	@GetMapping(value= {"moveInsertFlight","moveUpdateFlight"})
	public String moveInsertFlight(FlightVO vo, Model model) {
		model.addAttribute("flight", adminService.moveUpdateFlight(vo.getFlight()));
		return "admin/insertFlight";
	}
	@GetMapping(value="insertFlight")
	public String insertFlight(FlightVO vo) {
		adminService.insertFlight(vo);
		return "redirect:/flightManage";
	}
	
	@GetMapping(value="deleteSeat")
	public String deleteSeat(FlightVO vo) {
		adminService.deleteSeat(vo.getSeatNum());
		return "redirect:/flightManage";
	}
	@GetMapping(value="deleteFlight")
	public String deleteFlight(FlightVO vo) {
		adminService.deleteFlight(vo.getFlight());
		return "redirect:/flightManage";
	}
	
	@GetMapping(value="updateSeat")
	public String updateSeat(FlightVO vo) {
		adminService.updateSeat(vo);
		return "redirect:/flightManage";
	}
	@GetMapping(value="updateFlight")
	public String updateFlight(FlightVO vo) {
		adminService.updateFlight(vo);
		return "redirect:/flightManage";
	}
	
	@GetMapping(value="memberManage")
	public String memberManage(Model model) {
		model.addAttribute("count", adminService.count());
		model.addAttribute("memberList", adminService.selectMember());
		return "admin/memberManage";
	}
	
	
	/* Q&A */
	@GetMapping(value="qaList")
	public String q_and_a(Model model
			,@RequestParam(required =false, defaultValue="1")int page
			,@RequestParam(required =false, defaultValue="1")int range) {
		
		int listCnt = adminService.getQAListCnt();
		
		PageVO pagination = new PageVO();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("qaList", adminService.selectQA(pagination));
		return "admin/q_and_a";
	}
	
	@GetMapping(value="answer")
	public String answer(QAVO vo, Model model) {
		model.addAttribute("qa", qaService.selectQA(vo.getQa_num()));
		return "admin/answer";
	}
	
	@PostMapping(value="responseMessage")
	public String responseMessage(QAVO vo) {
		String setfrom = "shyoffice00@gmail.com";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(vo.getEmail());
			messageHelper.setSubject(vo.getTitle());
			messageHelper.setText(vo.getContext());
			
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			qaService.update();
		}
		
		return "redirect:/qaList";
	}
}
