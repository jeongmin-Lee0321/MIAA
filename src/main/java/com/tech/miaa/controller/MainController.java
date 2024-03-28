package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model, @SessionAttribute(name = "userId", required = false) String userId) {
		if(userId != null){
			System.out.println("로그인 유저의 id : "+userId);
		}else if(userId == null){
			System.out.println("로그인 하지 않았습니다.");
		}
		model.addAttribute("userId", userId);
		return "main_page.메인페이지.1";
	}
}
