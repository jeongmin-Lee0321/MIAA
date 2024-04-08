package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.dto.InquiryDto;
import com.tech.miaa.service.InquiryService;
import com.tech.miaa.serviceInter.MypageCustomerInquiryServiceInter;

@Controller
public class AdminInquiryController {
	@Autowired
	private SqlSession sqlSession;

	MypageCustomerInquiryServiceInter mypageCustomerInquiryServiceInter;
	

//	문의내역 페이지
	@RequestMapping("admin_inquiry_list_page")
	public String admin_inquiry_list_page(HttpServletRequest request, Model model, @SessionAttribute(name = "userId", required = false) String userId,
			@SessionAttribute(name = "isAdmin", required = false) String isAdmin) {

		String result = "redirect:/";
		if (isAdmin == null) {
			
			System.out.println("관리자아이디가 아닙니다");
			if (userId != null) {
				System.out.println("로그인 유저의 id : " + userId);
			} else if (userId == null) {
				System.out.println("로그인 하지 않았습니다.");
			}
		}
		else if (isAdmin.equals("admin")) {
			System.out.println("관리자입니다.");
			result = "admin_inquiry.list_page.1대1문의관리.3a";
			
			model.addAttribute("userId", userId);
			model.addAttribute("IsAdmin", isAdmin);
			model.addAttribute("request", request);
			model.addAttribute("sqlSession", sqlSession);
			
			try {
				mypageCustomerInquiryServiceInter=new InquiryService();
				ArrayList<InquiryDto> list=mypageCustomerInquiryServiceInter.inquiry_list(model);
				model.addAttribute("list",list);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
			
		return result;
	}

}