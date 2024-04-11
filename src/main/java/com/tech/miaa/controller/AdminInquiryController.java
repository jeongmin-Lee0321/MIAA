package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.dto.AdminInquiryDto;
import com.tech.miaa.service.AdminInquiryService;
import com.tech.miaa.serviceInter.AdminInquiryServiceInter;
import com.tech.miaa.vopage.PageVO;

@Controller
public class AdminInquiryController {
	@Autowired
	private SqlSession sqlSession;

	AdminInquiryServiceInter adminInquiryInter;
	

//	문의내역 페이지
	@RequestMapping("admin_inquiry_list_page")
	public String admin_inquiry_list_page(HttpServletRequest request, Model model, @SessionAttribute(name = "userId", required = false) String userId,
			@SessionAttribute(name = "isAdmin", required = false) String isAdmin) {
		String result = "redirect:/";
		String strPage = null;
		
		//접속자가 관리자인지 확인 후 뷰단경로 처리
		if (isAdmin == null) {		
			if (userId != null) {
				System.out.println("관리자아이디가 아닙니다");
				System.out.println("로그인 유저의 id : " + userId);
			} else if (userId == null) {
				System.out.println("로그인 하지 않았습니다.");
			}
		}
		else if (isAdmin.equals("admin")) {
			System.out.println("관리자입니다.");
			result = "admin_inquiry.list_page.1대1문의관리.3a";
		}
		
		//싱글톤위한 값 전달
		model.addAttribute("userId", userId);
		model.addAttribute("IsAdmin", isAdmin);
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		
		//inquiry 조인 테이블 가져오와서 모델에 넘기기
		adminInquiryInter=new AdminInquiryService();
		try {
			ArrayList<AdminInquiryDto> list=adminInquiryInter.inquiry_list(model);
			model.addAttribute("list",list);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//페이징 처리
			//시작페이지 전달
		try {
			strPage = request.getParameter("strPage");
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("strPage", strPage);
		
		PageVO pageVo = null;
		pageVo = adminInquiryInter.get_pagevo(model);
		
			
		return "admin_inquiry.list_page.1대1문의관리.3a";
	}

}