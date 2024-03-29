package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.service.ItemService;
import com.tech.miaa.serviceInter.ItemServiceInter;

@Controller
public class LostItemController {
	@Autowired
	private SqlSession sqlSession;
	
	ItemServiceInter itemService;
	
	
	@RequestMapping(value = "/lost_item_search_page", method = RequestMethod.GET)
	public String rescue_ani_search_page(HttpServletRequest request, Model model ) {
		model.addAttribute("sqlSession", sqlSession);
		
		 itemService = new ItemService(); 
		 ArrayList<ItemDto> itemList=itemService.lost_item_search(model);
		 
		 model.addAttribute("itemList", itemList);

		return "lost_item.search_page.분실물 상세검색.3";
	}

	
	@RequestMapping("lost_item_write_page")
	public String lost_item_write_view(Model model, @SessionAttribute(name = "userId", required = false) String userId){
		String result = "";
			if(userId!=null) {
				result = "lost_item.write_page.분실물등록.2";
			}else if(userId==null) {
				System.out.println("로그인 해야만 작성이 가능합니다.");
				result = "login.loginform_page.로그인페이지.1";

			}
		return result;
	}
	@RequestMapping("lost_item_write")
	public String lost_item_write(HttpServletRequest request, Model model, MultipartHttpServletRequest multi){
		model.addAttribute("request", request); model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("multi", multi);
		
		itemService=new ItemService();
		String result=itemService.lost_item_write(model);
		
		return result;
	}

	//JeongMin
	@RequestMapping(value = "/lost_item_detail_page", method = RequestMethod.GET)
	public String lost_item_detail_page(HttpServletRequest request, Model model ) {

		return "lost_item.detail_page.분실물 상세페이지.2";
	}
}
