
package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.AdminInquiryDao;
import com.tech.miaa.dto.AdminInquiryDto;
import com.tech.miaa.dto.AdminInquirySearchDto;
import com.tech.miaa.serviceInter.AdminMainDataServiceInter;

public class AdminMainDataService implements AdminMainDataServiceInter {

	@Override
	public void get_main_data(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		AdminInquirySearchDto dto = (AdminInquirySearchDto) map.get("dto");
		String id = (String) map.get("userId");



		// db에서 list가져오기
		AdminInquiryDao dao = sqlSession.getMapper(AdminInquiryDao.class);
		ArrayList<AdminInquiryDto> list = null;

			try {
				list = dao.join_inquiry_list(dto);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		model.addAttribute("search", dto);
		model.addAttribute("list", list);

	}

	
}
