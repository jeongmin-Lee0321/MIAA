package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.ItemDto;
// 원진호_알림목록_0401추가
public interface MypageMatchingAlarmServiceInter {
	/* 원진호_0403_수정_Model추가_ArrayList<ItemDto>추가 */
	public String mypage_matching_alarm(Model model);
	public ArrayList<ItemDto> matching_alarm_list(Model model);
}
