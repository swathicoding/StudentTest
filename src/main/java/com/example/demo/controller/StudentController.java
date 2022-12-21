package com.example.demo.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.service.LoginService;

@Controller
public class StudentController {
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String loginPage() {
		return "student";
	}
	
	@PostMapping("/authenticate")
	public String authenticate(String userid, String password, HttpServletRequest request,ModelMap model) {
		String message = loginService.authenticate(userid, password);
		if(message.equalsIgnoreCase("SUCCESS")) {
			loginService.studentDetails(model);
			model.addAttribute("username", userid);
			return "welcome";
		} else {
			model.addAttribute("error", "Incorrect Username or Password");
			return "student";
		}
	}
}
