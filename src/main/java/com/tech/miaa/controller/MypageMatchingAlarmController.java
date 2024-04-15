package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.service.ItemService;
import com.tech.miaa.service.MatchingAlarmService;
import com.tech.miaa.serviceInter.ItemServiceInter;
import com.tech.miaa.serviceInter.MypageMatchingAlarmServiceInter;

//원진호_알림목록_0401추가
@Controller
public class MypageMatchingAlarmController {
	@Autowired
	private SqlSession sqlSession;
	MypageMatchingAlarmServiceInter mypageMatchingAlarmServiceInter;
	/* 원진호_0409추가 */
	ItemServiceInter itemService;

	/* 원진호_0401추가 */
	/* 원진호_0409_수정 */
	@RequestMapping(value = "mypage_matching_alarm_list_page", method = RequestMethod.GET)
	public String mypage_matching_alarm_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		/* 원진호_0409추가 */
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		itemService = new ItemService();

		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			ArrayList<ItemDto> itemList = itemService.lost_item_search(model);
			model.addAttribute("list", list);
			model.addAttribute("itemList", itemList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_list_page.알림 목록.3";
	}

	/* 원진호_0409_수정 */
	@RequestMapping(value = "mypage_matching_alarm_keyword_list_page", method = RequestMethod.GET)
	public String mypage_matching_alarm_keyword_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		/* 원진호_0409추가 */
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		itemService = new ItemService();

		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			ArrayList<ItemDto> itemList = itemService.lost_item_search(model);
			model.addAttribute("list", list);
			model.addAttribute("itemList", itemList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_keyword_list_page.알림 목록.3";
	}

	/* 원진호_0409_수정 */
	@RequestMapping("mypage_matching_alarm_detail_list_page")
	public String mypage_matching_alarm_detail_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		/* 원진호_0409추가 */
		itemService = new ItemService();
		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			ArrayList<ItemDto> itemList = itemService.lost_item_search(model);
			model.addAttribute("list", list);
			model.addAttribute("itemList", itemList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_detail_list_page.알림 목록.3";
	}

	/* weonjinho_0410추가 */
	@RequestMapping(value = "mypage_matching_alarm_ani_list_page", method = RequestMethod.GET)
	public String mypage_matching_alarm_ani_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		/* 원진호_0409추가 */
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		itemService = new ItemService();

		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			ArrayList<ItemDto> itemList = itemService.lost_item_search(model);
			model.addAttribute("list", list);
			model.addAttribute("itemList", itemList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_ani_list_page.알림 목록.3";
	}

	/* weonjinho_0410추가 */
	@RequestMapping(value = "mypage_matching_alarm_item_list_page", method = RequestMethod.GET)
	public String mypage_matching_alarm_item_list_page(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		/* 원진호_0409추가 */
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		itemService = new ItemService();

		try {
			ArrayList<ItemDto> list = mypageMatchingAlarmServiceInter.matching_alarm_list(model);
			ArrayList<ItemDto> itemList = itemService.lost_item_search(model);
			model.addAttribute("list", list);
			model.addAttribute("itemList", itemList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage_matching.alarm_item_list_page.알림 목록.3";
	}

	// 원진호_0412_원글삭제기능 추가
	@RequestMapping(value = "/mypage_alarm_delete")
	public String mypage_alarm_delete(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("userId", userId);
		mypageMatchingAlarmServiceInter = new MatchingAlarmService();
		String[] ajaxMsg = request.getParameterValues("valueArr");
		System.out.println(ajaxMsg);
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			mypageMatchingAlarmServiceInter.mypage_alarm_delete(ajaxMsg[i], model);
		}
		return "redirect:mypage_customer_inquiry_list_page";
	}

}
