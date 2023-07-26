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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;

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
		
		String loginmsg = "LOGIN_NO";
		if(dto != null) {
			request.getSession().setAttribute("login", dto);	// session 저장			
			request.getSession().setMaxInactiveInterval(60*60);
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
	
	@GetMapping("mypage.do")
	public String mypage() {
	System.out.println("MemberController mypage() " + new Date());

	return "mypage";
	}
	
	@GetMapping("logout.do")
	public String logout(HttpServletRequest request) {
		System.out.println("MemberController logout() " + new Date());
		
		request.getSession().invalidate();
		
	return "login";
	}
	
	@ResponseBody
	@PostMapping("changeInfo.do")
	public String changeInfo(@RequestBody MemberDto mem, HttpServletRequest request) {
		System.out.println("MemberController changeInfo() " + new Date());	
		
		if (service.changeInfo(mem)) {
			System.out.println(mem);
			request.getSession().setAttribute("login", mem);
			return "success";	
		}
		return "fail";

	}
	
	@GetMapping("changePwd.do")
	public String changePwd() { 
		System.out.println("MemberController changePwd() " + new Date());	
		
	return "changepwd";	
	}
	
	
	@PostMapping("changepwdAf.do")
	public String changepwdAf(MemberDto dto, Model model) {
		System.out.println("MemberController changepwdAf() " + new Date());
		
		String changemsg="CHANGE_NO";
		
		if (service.changepwdAf(dto) == true) {
			changemsg = "CHANGE_YES";
			
		}
		model.addAttribute("changemsg", changemsg);
		
		System.out.println("컨트롤러dto changemsg???" + changemsg);
		return "changemsg";
	}
	

	
	
	
}
