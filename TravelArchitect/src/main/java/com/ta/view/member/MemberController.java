package com.ta.view.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ta.biz.address.AddressService;
import com.ta.biz.member.MemberService;
import com.ta.biz.member.MemberVO;
import com.ta.biz.member.QAService;
import com.ta.biz.member.QAVO;

@Controller
@SessionAttributes(value = { "adminUser", "loginMember" })
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired 
	private AddressService addressService;
	@Autowired
	private QAService qaService;
	
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO vo, Model model) {
		MemberVO loginCheck = memberService.memberLogin(vo);
		String alert = "아이디를 입력해주세요.";
		if (loginCheck != null) {
			if (loginCheck.getId().equals("none")) {// ���̵� �Է� ���ҽ�
				alert = "아이디가 존재하지 않습니다.";
			} else if (!loginCheck.getPwd().equals(vo.getPwd())) { // ����� Ʋ����
				alert = "비밀번호가 틀립니다.";
			} else {
				if (loginCheck.getAuthority().equals("1")) {
					model.addAttribute("adminUser", loginCheck);
					return "redirect:/";
				} else {
					model.addAttribute("loginMember", loginCheck);
					return "index";
				}
				
			}
		}
			
		
		model.addAttribute("alert", alert);
		return "member/login";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/loginForm";
	}

	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join";
	}

	@RequestMapping(value = "idCheckForm", method = RequestMethod.GET)
	public String idCheckForm(Model model, HttpServletRequest request) {
		model.addAttribute("id", request.getParameter("id"));
		return "member/idCheck";
	}

	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public String idCheck(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		int message = 0;
		if (memberService.checkMember(id) != null) {
			message = 1;
		} else {
			message = -1;
		}
		model.addAttribute("id", id);
		model.addAttribute("message", message);
		return "member/idCheck";
	}

	@RequestMapping(value = "findZipNum", method = RequestMethod.GET)
	public String findZipNumGet() {
		return "member/findZipNum";
	}

	@RequestMapping(value = "findZipNum", method = RequestMethod.POST)
	public String findZipNumPost(HttpServletRequest request, Model model) throws IOException {
		String dong = request.getParameter("dong");
		model.addAttribute("addressList", addressService.selectAddressByDong(dong));
		return "member/findZipNum";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@RequestParam Map<String, String> request, MemberVO vo) {
		String address = request.get("zipNum") + " " + request.get("addr1") + " " + request.get("addr2");
		vo.setAddress(address);
		memberService.insertMember(vo);
		return "member/login";
	}

	@RequestMapping(value = "findIdForm", method = RequestMethod.GET)
	public String findIdform() {
		return "member/findIdForm";
	}

	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findId(MemberVO vo, Model model) {

		String id = memberService.findId(vo);
		int message = 0;
		if (id != null) {
			message = 1;
		} else {
			message = -1;
		}
		model.addAttribute("id", id);
		model.addAttribute("message", message);
		return "member/findIdForm";
	}

	@RequestMapping(value = "findPasswordForm", method = RequestMethod.GET)
	public String findPasswordForm() {
		return "member/findPasswordForm";
	}

	@RequestMapping(value = "findPassword", method = RequestMethod.POST)
	public String findPassword(MemberVO vo, Model model) {
		String pwd = memberService.findPwd(vo.getId());
		int message = 0;
		if (pwd != null) {
			message = 1;
		} else {
			message = -1;
		}
		model.addAttribute("message", message);
		model.addAttribute("pwd", pwd);
		return "member/findPasswordForm";
	}

	@RequestMapping(value = "deleteMember", method = RequestMethod.GET)
	public String deleteMember(@SessionAttribute("loginMember") MemberVO session) {
		memberService.deleteMember(session.getId());
		return "member/login";
	}

	@RequestMapping(value = "updateMemberForm", method = RequestMethod.GET)
	public String updateMemberForm() {
		return "member/update";
	}

	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String updqteMember(MemberVO vo, @RequestParam Map<String, String> request,
			@SessionAttribute("loginMember") MemberVO session, Model model) {

		String address = request.get("zipNum") + " " + request.get("addr1") + " " + request.get("addr2");
		vo.setId(session.getId());
		vo.setAddress(address);

		memberService.updateMember(vo);

		model.addAttribute("loginMember", vo);

		return "redirect:mypage";
	}
	
	@PostMapping(value="sentMessage")
	public String sentMessage(QAVO vo) {
		qaService.inesrtSentMessage(vo);
		return "page/contact";
	}
}
