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
public class FoundItemController {
	@Autowired
	private SqlSession sqlSession;



	@RequestMapping(value = "/found_item_search_page", method = RequestMethod.GET)
	public String found_item_search_page(HttpServletRequest request, Model model ) {
		
		return "found_item.search_page.습득물 상세검색.3";
	}
}
