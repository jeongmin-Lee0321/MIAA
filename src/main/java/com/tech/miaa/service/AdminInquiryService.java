
package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.AdminInquiryDao;
import com.tech.miaa.dto.AdminInquiryDto;
import com.tech.miaa.dto.AdminInquirySearchDto;
import com.tech.miaa.serviceInter.AdminInquiryServiceInter;
import com.tech.miaa.vopage.PageVO;

public class AdminInquiryService implements AdminInquiryServiceInter {

	@Override
	public void inquiry_list(Model model, PageVO pageVo) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		AdminInquirySearchDto dto = (AdminInquirySearchDto) map.get("dto");
		String id = (String) map.get("userId");

		// 페이징 처리를 위한 pageVo 가져오기-(현재페이지를 가져와서 현재페이지경우의수를 정한후 PageVo를 셋팅)
		pageVo = get_pagevo(model, pageVo);

		model.addAttribute("pageVo", pageVo);

		// 만들어진 PageVo로 글목록의 star와 end를 가져옴
		int rowStart = pageVo.getRowStart();
		int rowEnd = pageVo.getRowEnd();
		
		//전달받은 검색 조건 세팅
		set_search_dto(model,pageVo);
		
		//db에서 list가져오기
		AdminInquiryDao dao = sqlSession.getMapper(AdminInquiryDao.class);
		ArrayList<AdminInquiryDto> list = null;
		if (rowStart == 0 && rowEnd == 0) {
			System.out.println("get_pagevo 문제발생");
		
		} else {
			try {
				list = dao.join_inquiry_list(dto);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		model.addAttribute("search", dto);
		model.addAttribute("list", list);
		

	}

	@Override
	public PageVO get_pagevo(Model model, PageVO pageVo) {
		int page = 0; // 현재 페이지
		int total = 0; // 모든 게시물 갯수
		int displayRowCount = 6; // 보여질 페이지 갯수

		Map<String, Object> map = model.asMap();
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		AdminInquirySearchDto dto = (AdminInquirySearchDto) map.get("dto");
		String currPage = request.getParameter("currPage");

		// 토탈페이지 먼저 구하기
		AdminInquiryDao dao = sqlSession.getMapper(AdminInquiryDao.class);

		try {
			total = dao.get_total(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("전체 목록개수" + total);
		// 현재페이지 경우의수
		if (currPage == null) { // strPage 가 뷰에서 전달되지 않은경우(첫화면)
			currPage = "1";
			page = Integer.parseInt(currPage);
		} else { // strPage값이 뷰에서 현재로 전달된경우
			page = Integer.parseInt(currPage);
			if (page > total / displayRowCount) {// 현재페이지 값이 총 페이지 갯수보다 클경우 시작페이지= 총페이지 갯수
				page = total / displayRowCount + (total % displayRowCount == 0 ? 0 : 1);
			} else if (page <= 0) {// 시작페이지 값이 음수일경우 page =1
				page = 1;
			}
		}

		pageVo.setDisplayRowCount(displayRowCount);// 보여질 페이지 갯수 적용
		pageVo.setPage(page);// 시작페이지 적용

		pageVo.pageCalculate(total);

		System.out.println("전달받은 현재페이지" + currPage);

		return pageVo;
	}
	@Override
	public void set_search_dto(Model model, PageVO pageVo) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		AdminInquirySearchDto dto = (AdminInquirySearchDto) map.get("dto");
		// 만들어진 PageVo로 글목록의 star와 end를 가져옴
		int rowStart = pageVo.getRowStart();
		int rowEnd = pageVo.getRowEnd();
		dto.setRowEnd(rowEnd);
		dto.setRowStart(rowStart);
		
		//param-> null 이면 최초 화면
		
		//param -> null이 아니면 검색조건 추가한 창

		String START_YMD=request.getParameter("START_YMD");
		String END_YMD=request.getParameter("END_YMD");

		String reply_status=request.getParameter("reply_status");
		
		String search_type=request.getParameter("search_type");
		String search_content=request.getParameter("search_content");
		
		
		try {
			System.out.println(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("dto.getEND_YMD(): "+dto.getEND_YMD());
		System.out.println("START_YMD: "+START_YMD==null);
		System.out.println("START_YMD: "+START_YMD);
		System.out.println("END_YMD: "+END_YMD==null);
		System.out.println("END_YMD: "+END_YMD);

		dto.setEND_YMD(END_YMD);
		dto.setSTART_YMD(START_YMD);
		dto.setReply_status(reply_status);
		dto.setSearch_type(search_type);
		dto.setSearch_content(search_content);
		
	}
	
	

}
