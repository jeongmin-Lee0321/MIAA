package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.miaa.dto.FounditemDto;
import com.tech.miaa.service.FounditemService;
import com.tech.miaa.serviceInter.FounditemServiceInter;

@Controller
public class FoundItemController {
	@Autowired
	private SqlSession sqlSession;
	FounditemServiceInter fservice;

	@RequestMapping(value = "/found_item_search_page", method = RequestMethod.GET)
	public String found_item_search_page(HttpServletRequest request, Model model) {

		return "found_item.search_page.습득물 상세검색.3";
	}

	// mhs
	@RequestMapping(value = "found_item_search1", method = RequestMethod.GET)
	public String found_item_search1(HttpServletRequest request, Model model) {
		String xml_code="";
		System.out.println("컨트롤러_기간분류별");
//		데이터가져오기
		model.addAttribute("request", request);
		fservice = new FounditemService();
		xml_code=fservice.found_item_search_AreaPd(model);
		System.out.println(xml_code);
		ArrayList<FounditemDto> list;
		list=fservice.getFoundList(xml_code);
		int total = fservice.getTotal();
		model.addAttribute("list",list);
		model.addAttribute("total",total);	
		model.addAttribute("xml_code",xml_code);
		model.addAttribute("pageNum","0");
		System.out.println(list);
		System.out.println(total);

		return "found_item.search_page.습득물 상세검색.3";
	}

	// mhs
	@RequestMapping(value = "found_item_search2", method = RequestMethod.GET)
	public String found_item_search2(HttpServletRequest request, Model model) {
		System.out.println("found_item_search1");
//			데이터가져오기
		model.addAttribute("request", request);
		fservice = new FounditemService();
		String xml_code=fservice.found_item_search_Place(model);
		ArrayList<FounditemDto> list;
		list=fservice.getFoundList(xml_code);
		int total = fservice.getTotal();
		model.addAttribute("list",list);
		model.addAttribute("total",total);
		model.addAttribute("xml_code",xml_code);

		return "found_item.search_page.습득물 상세검색.3";
	}
	
	// mhs
	@RequestMapping(value = "found_item_view",method = RequestMethod.POST)
	public String found_item_view(HttpServletRequest request, Model model) {
		String page = request.getParameter("page");
		String xml_code = request.getParameter("xml_code");
		System.out.println("페이지값 : "+page);
		System.out.println("코드 : "+xml_code);
		
		  // 데이터가져오기
		  ArrayList<FounditemDto> list;
		  list=fservice.getFoundList(xml_code);
		  model.addAttribute("list",list); 
		  int total = fservice.getTotal();
		  model.addAttribute("total",total);
		  model.addAttribute("xml_code",xml_code);
		  model.addAttribute("pageNum",page);

		return "found_item.search_page.습득물 상세검색.3";
	}

	// JeongMin
	@RequestMapping(value = "/found_item_detail_page", method = RequestMethod.GET)
	public String found_item_detail_page(HttpServletRequest request, Model model) {

		return "found_item.detail_page.습득물 상세페이지.2";
	}
}
