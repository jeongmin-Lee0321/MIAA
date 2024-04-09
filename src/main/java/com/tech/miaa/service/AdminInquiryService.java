
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
	public ArrayList<AdminInquiryDto> inquiry_list(Model model) {
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
		
		return list;
		
	}
	
	@Override
	public PageVO get_pagevo(Model model) {
		int page = 0; //시작 페이지
		int total = 0; //모든 게시물 갯수
		
		Map<String, Object> map = model.asMap();
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		String strPage = (String) map.get("strPage");
		
		//토탈페이지 먼저 구하기
		AdminInquiryDao dao = sqlSession.getMapper(AdminInquiryDao.class);
		
		try {
			total = dao.get_total();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("전체 목록개수"+total);
		
		
		
		return null;
	}

}
