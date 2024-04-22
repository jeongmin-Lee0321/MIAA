package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.MypagePostDao;
import com.tech.miaa.dto.MypagePostDto;
import com.tech.miaa.serviceInter.MypagePostServiceInter;

public class MypagePostService implements MypagePostServiceInter{

	@Override
	public void MypagyPost_list(Model model) {
		Map<String, Object> map = model.asMap(); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request"); String userId=(String) map.get("userId");
		MypagePostDao dao = sqlSession.getMapper(MypagePostDao.class);
		ArrayList<MypagePostDto> dtos = dao.mypage_post_list_page(userId);

		for (int i = 0; i < dtos.size(); i++) {
			if(dtos.get(i).getItem_id()!=null) {
				dtos.get(i).setKind("물건");
			}else{
				dtos.get(i).setKind("동물");
			}
			if(dtos.get(i).getFilename()==null) {
				if(dtos.get(i).getUpkind().equals("417000")) {
					dtos.get(i).setFilename("resources/ani_default/강아지.png");
				}else if(dtos.get(i).getUpkind().equals("422400")) {
					dtos.get(i).setFilename("resources/ani_default/고양이.png");
				}else if(dtos.get(i).getUpkind().equals("429900")) {
					dtos.get(i).setFilename("resources/ani_default/기타.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRI000")) {
					dtos.get(i).setFilename("resources/item_default/노트북.png");
				}else if(dtos.get(i).getUpkind().equals("PRJ000")) {
					dtos.get(i).setFilename("resources/item_default/휴대폰.png");
				}else if(dtos.get(i).getUpkind().equals("PRH000")) {
					dtos.get(i).setFilename("resources/item_default/지갑.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRG000")) {
					dtos.get(i).setFilename("resources/item_default/전자기기.png");
				}else if(dtos.get(i).getUpkind().equals("PRD000")) {
					dtos.get(i).setFilename("resources/item_default/산업.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRO000")) {
					dtos.get(i).setFilename("resources/item_default/보석.png");
				}else if(dtos.get(i).getUpkind().equals("PRZ000")) {
					dtos.get(i).setFilename("resources/item_default/기타물품.png");
				}else if(dtos.get(i).getUpkind().equals("PRC000")) {
					dtos.get(i).setFilename("resources/item_default/서류.png");
				}else if(dtos.get(i).getUpkind().equals("PRE000")) {
					dtos.get(i).setFilename("resources/item_default/스포츠.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRF000")) {
					dtos.get(i).setFilename("resources/item_default/자동차.png");
				}else if(dtos.get(i).getUpkind().equals("PRL000")) {
					dtos.get(i).setFilename("resources/item_default/현금.png");
				}else if(dtos.get(i).getUpkind().equals("PRK000")) {
					dtos.get(i).setFilename("resources/item_default/의류.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRQ000")) {
					dtos.get(i).setFilename("resources/item_default/쇼핑백.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRR000")) {
					dtos.get(i).setFilename("resources/item_default/악기.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRP000")) {
					dtos.get(i).setFilename("resources/item_default/카드.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRM000")) {
					dtos.get(i).setFilename("resources/item_default/증권.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRN000")) {
					dtos.get(i).setFilename("resources/item_default/증명서.png");
				}else if(dtos.get(i).getUpkind().equals("PRA000")) {
					dtos.get(i).setFilename("resources/item_default/가방.png"); 
				}else if(dtos.get(i).getUpkind().equals("PRB000")) {
					dtos.get(i).setFilename("resources/item_default/책.png");
				}else if(dtos.get(i).getUpkind().equals("PRX000")) {
					dtos.get(i).setFilename("resources/item_default/유류물품.png");
				}
			}
		}
		model.addAttribute("dtos", dtos);
	}
}
