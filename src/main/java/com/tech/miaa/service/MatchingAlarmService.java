
package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.MatchingAlarmDao;
import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.serviceInter.MypageMatchingAlarmServiceInter;

/* 원진호_0403_MatchingAlarmService.java추가_@Override작성_return값추가. */
public class MatchingAlarmService implements MypageMatchingAlarmServiceInter {

   @Override
   public ArrayList<ItemDto> matching_alarm_list(Model model) {
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map.get("request");
      SqlSession sqlSession = (SqlSession) map.get("sqlSession");
      HttpSession session = request.getSession();
      
      String id=(String) session.getAttribute("userId");
      MatchingAlarmDao dao = sqlSession.getMapper(MatchingAlarmDao.class);
      ArrayList<ItemDto> list = null;
      try {
         list = dao.matching_alarm_list(id);         
      } catch (Exception e) {
         // TODO: handle exception
      }      
      return list;
   }

}