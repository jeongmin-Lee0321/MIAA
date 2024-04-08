package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.ItemDto;
// 원진호_알림목록_0401추가
public interface MypageMatchingAlarmServiceInter {
	ArrayList<ItemDto> matching_alarm_list(Model model);
}
