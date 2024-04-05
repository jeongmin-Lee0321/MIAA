package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.service.MatchingAlarmService;
import com.tech.miaa.serviceInter.MypageMatchingAlarmServiceInter;

//원진호_알림목록_0401추가
@Controller
public class MypageMatchingAlarmController {
	@Autowired
	private SqlSession sqlSession;
	MypageMatchingAlarmServiceInter mypageMatchingAlarmServiceInter;

	/* 원진호_0401추가 */
	@RequestMapping("mypage_matching_alarm_list_page")
	public String mypage_matching_alarm_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "mypage_matching.alarm_list_page.알림 목록.3";
	}

}
