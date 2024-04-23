package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.tech.miaa.abdmApi.AbdmPublicItem;
import com.tech.miaa.dao.MatchingAlarmDao;
import com.tech.miaa.dto.FounditemDto;
import com.tech.miaa.dto.matchingAlarmDto;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.ArrayList;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model, @SessionAttribute(name = "userId", required = false) String userId) {
		if(userId != null){
			System.out.println("로그인 유저의 id : "+userId);
			MatchingAlarmDao matchingAlarmDao = sqlSession.getMapper(MatchingAlarmDao.class);
			ArrayList<FounditemDto> founditemDtos = new ArrayList<>();
			ArrayList<AbdmPublicItem> abdmPublicItems = new ArrayList<>();
			ArrayList<matchingAlarmDto> dtos =matchingAlarmDao.get_user_alarm_list(userId);
			for (matchingAlarmDto dto: dtos){
				if (dto.getType()=="atcid"){
					founditemDtos.add(matchingAlarmDao.get_item_data(dto.getPrimeid()));
				}else if (dto.getType() == "desertionNo"){
					abdmPublicItems.add(matchingAlarmDao.get_animal_data(dto.getPrimeid()));
				}
			}
			model.addAttribute("items",founditemDtos);
			model.addAttribute("animals",founditemDtos);
		}else if(userId == null){
			System.out.println("로그인 하지 않았습니다.");
		}

		model.addAttribute("userId", userId);
		return "main_page.메인페이지.1";
	}

}
