
package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.miaa.dao.AdminInquiryDao;
import com.tech.miaa.dto.AdminInquiryDto;
import com.tech.miaa.dto.AdminInquirySearchDto;
import com.tech.miaa.vopage.PageVO;

public class AdminMainDataService implements AdminAdminMainDataServiceInter {

	@Override
	public void get_main_data(Model model) {
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

		// 전달받은 검색 조건 세팅
		set_search_dto(model, pageVo);

		// db에서 list가져오기
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

	
}
