
package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.AdminInquiryDao;
import com.tech.miaa.dto.AdminInquiryDto;
import com.tech.miaa.serviceInter.AdminInquiryServiceInter;
import com.tech.miaa.vopage.PageVO;

public class AdminInquiryService implements AdminInquiryServiceInter {

	
	@Override
	public void inquiry_list(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");

		String id = (String) map.get("userId");
		
		
		
		
		AdminInquiryDao dao = sqlSession.getMapper(AdminInquiryDao.class);
		ArrayList<AdminInquiryDto> list=null;
		try {
			list = dao.join_inquiry_list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list",list);
		
		
	}
	
	@Override
	public void get_pagevo(Model model) {
		int page = 0; //시작 페이지
		int total = 0; //모든 게시물 갯수
		int displayRowCount = 6 ; //보여질 페이지 갯수
		PageVO pageVo = new PageVO();
		
		Map<String, Object> map = model.asMap();
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String strPage = request.getParameter("strPage");

		//토탈페이지 먼저 구하기
		AdminInquiryDao dao = sqlSession.getMapper(AdminInquiryDao.class);
		
		try {
			total = dao.get_total();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("전체 목록개수"+total);
		//시작페이지 경우의수
		if(strPage==null) { //strPage 가 뷰에서 전달되지 않은경우
			strPage = "1";
			page = Integer.parseInt(strPage);
		}else { //strPage값이 뷰에서 현재로 전달된경우
			page = Integer.parseInt(strPage);
			if(page > total/displayRowCount) {//시작페이지 값이 총 페이지 갯수보다 클경우 시작페이지= 총페이지 갯수
				page = total/displayRowCount+(total%displayRowCount==0?0:1);
			}else if(page<0) {//시작페이지 값이 음수일경우 page =1
				page = 1;
			}
		}
		
		pageVo.setDisplayRowCount(displayRowCount);
		pageVo.setPage(page);
		
		pageVo.pageCalculate(total);
		
		model.addAttribute("pageVo", pageVo);
		System.out.println("전달받은 시작페이지"+ strPage);
		
	}

}
