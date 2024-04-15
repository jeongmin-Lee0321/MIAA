package com.tech.miaa.dao;

import java.util.ArrayList;

import com.tech.miaa.dto.FounditemDto;
import com.tech.miaa.dto.ItemDto;
import org.apache.ibatis.annotations.Param;

/* 원진호_0403_matching_alarm_list(String id)추가 */
public interface MatchingAlarmDao {
   public ArrayList<ItemDto> matching_alarm_list(String id);
   /*원진호_0412_원글삭제기능추가*/
	public void mypage_alarm_delete(String string, String id);
    public void alert_item_write(String user_id,String atcid,String fdSbjt,String fdSn,
                                 String prdtClNm,String fdPrdtNm,String fdYmd,String depPlace,
                                 String rnum,String clrNm,String fdFilePathImg,String addr);
}