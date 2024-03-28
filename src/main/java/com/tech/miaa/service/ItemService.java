
package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.ItemDao;
import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.serviceInter.ItemServiceInter;

public class ItemService implements ItemServiceInter {

	@Override
	public String lost_item_write(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		String result="";
		
		String tel=request.getParameter("tel");
		String openclose=request.getParameter("openclose");
		String lostday=request.getParameter("lostday");
		String address=request.getParameter("address");
		String itemname=request.getParameter("itemname");
		String itemkind1=request.getParameter("itemkind1");
		String itemkind2=request.getParameter("itemkind2");
		String colorCd=request.getParameter("colorCd");
		String sepcialMark=request.getParameter("sepcialMark");
		String userId=request.getParameter("userId");
		
		if(lostday==""|| address==""|| itemname==""|| itemkind2=="") {
			System.out.println("필수 입력란을 모두 기입하세요.");
			result="redirect:lost_item_write_view";
		}else {
			ItemDao dao = sqlSession.getMapper(ItemDao.class);
			dao.itemWrite(tel, openclose, lostday, address, itemname, itemkind1, itemkind2, colorCd, sepcialMark, userId);
			System.out.println("등록되었습니다.");
			result="redirect:/";
		}
		return result;
	}

	@Override
	public ArrayList<ItemDto> lost_item_search(Model model) {
		Map<String, Object> map = model.asMap();
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		ArrayList<ItemDto> itemList = dao.itemlistview();
		
		return itemList;
	}
}
