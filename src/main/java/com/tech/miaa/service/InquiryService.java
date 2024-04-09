
package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.InquiryDao;
import com.tech.miaa.dto.InquiryDto;
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
		
		//해시맵에 파람값 등록 하여 dao실행
		HashMap<String, Object> map1= new HashMap<>();
		map1.put("userId", id);
		map1.put("inquiry_title", title);
		map1.put("inquiry_content", content);
		map1.put("inquiry_file", file);
		
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		dao.inquiry_wirte(map1);
		
		//시퀀스로 생성한 board_num으로 admin_inquiry 테이블에도 작성
		System.out.println("시퀀스넘버:"+map1.get("board_num"));
		dao.admin_inquiry_add(map1);
		
	}
	@Override
	public ArrayList<InquiryDto> inquiry_list(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String board_num=request.getParameter("board_num");
		String id = (String) session.getAttribute("userId");
		
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		ArrayList<InquiryDto> list=null;
		try {
			list = dao.inquiry_list(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	@Override
	public void delete(String string, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String id = (String) session.getAttribute("userId");
		
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		dao.delete(string,id);
		
	}

}
