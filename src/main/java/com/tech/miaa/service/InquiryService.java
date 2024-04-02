
package com.tech.miaa.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.InquiryDao;
import com.tech.miaa.serviceInter.MypageCustomerInquiryServiceInter;

public class InquiryService implements MypageCustomerInquiryServiceInter {

	
	@Override
	public void inquiry_wirte(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String id = (String) session.getAttribute("userId");
		String title=request.getParameter("inquiry_title");
		String content=request.getParameter("inquiry_content");
		String file=request.getParameter("inquiry_file");
		
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		dao.inquiry_wirte(id,title,content,file);
		
	}
}
