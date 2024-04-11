package com.tech.miaa.dao;

import java.util.ArrayList;

import com.tech.miaa.dto.ItemDto;

/* 원진호_0403_matching_alarm_list(String id)추가 */
public interface MatchingAlarmDao {
   public ArrayList<ItemDto> matching_alarm_list(String id);
}