package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.ItemDto;
// 원진호_알림목록_0401추가
public interface MypageMatchingAlarmServiceInter {
	/* public String mypage_matching_alarm(Model model); */
	/* 원진호_0409_추가 */
	ArrayList<ItemDto> matching_alarm_list(Model model);

	public void mypage_alarm_delete(String string, Model model);
}
