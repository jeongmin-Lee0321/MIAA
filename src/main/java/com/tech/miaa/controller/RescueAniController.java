package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.service.AnimalService;
import com.tech.miaa.serviceInter.AnimalServiceInter;

@Controller
public class RescueAniController {
	@Autowired
	private SqlSession sqlSession;



	@RequestMapping(value = "/rescue_ani_search_page", method = RequestMethod.GET)
	public String rescue_ani_search_page(HttpServletRequest request, Model model ) {
		
		return "rescue_ani.search_page.보호동물 검색.3";
	}
}
