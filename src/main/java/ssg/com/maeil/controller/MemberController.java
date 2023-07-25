package ssg.com.maeil.controller;

import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ssg.com.maeil.dto.AnnouncementDto;
import ssg.com.maeil.dto.MemberDto;
import ssg.com.maeil.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("login.do")
	public String login() {
	System.out.println("MemberController login() " + new Date());
		
	return "login";
	}
	
	@PostMapping("loginAf.do")
	public String loginAf(MemberDto mem, Model model, HttpServletRequest request) {
	System.out.println("MemberController loginAf() " + new Date());
	
		MemberDto dto = service.login(mem);
		
		System.out.println("mem값이 없어?" + mem);
		
		String loginmsg = "LOGIN_NO";
		if(dto != null) {
			request.getSession().setAttribute("login", dto);	// session 저장			
			loginmsg = "LOGIN_YES";
		}
		model.addAttribute("loginmsg", loginmsg);
	
	return "message";
	}
		
	@RequestMapping("main.do")
	public String main() {
	System.out.println("MemberController main() " + new Date());
		
	return "main";
	}
	
	@GetMapping("newemployee.do")
	public String newemployee() {
		System.out.println("MemberController newemployee() " + new Date());
		
		return "newemployee";
	}
	@PostMapping("newemployeeAf.do")
	public String newemployeeAf(MemberDto dto,Model model) {
		System.out.println("MemberController newemployeeAf() " + new Date());
		System.out.println(dto.toString());
		boolean isS = service.newemployee(dto);
		String employeemessage = "가입성공";
		if(isS==false) {
			employeemessage ="가입성공실패.";
		}
		model.addAttribute("employeemessage",employeemessage);
		return "message";
	}
	
}
