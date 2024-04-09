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
	public String admin_inquiry_list_page(HttpServletRequest request, Model model, @SessionAttribute(name = "userId", required = false) String userId) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId",userId);
		
		mypageCustomerInquiryServiceInter=new InquiryService();
		try {
//			ArrayList<InquiryDto> list=mypageCustomerInquiryServiceInter.inquiry_list(model);
//			model.addAttribute("list",list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		return "admin_inquiry.list_page.1대1문의관리.3a";
	}

}