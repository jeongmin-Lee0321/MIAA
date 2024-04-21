package com.tech.miaa.dao;

import java.util.ArrayList;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.dto.LastDataCheckDto;
import com.tech.miaa.dto.matchingAlarmDto;

/* 원진호_0403_matching_alarm_list(String id)추가 */
public interface MatchingAlarmDao {
	public ArrayList<ItemDto> matching_alarm_list(String id);

	/* 원진호_0412_원글삭제기능추가 */
	public void mypage_alarm_delete(String string, String id);
	
	public void total_item_write(String atcid, String clrNm, String depPlace, String fdFilePathImg, String fdPrdtNm,
			String fdSbjt, String fdSn, String fdYmd, String prdtClNm, String rnum, String addr);
	
	public void total_animal_write(String desertionNo, String filename,String happenDt,
			String happenPlace, String kindCd, String colorCd, String age, String weight,
			String noticeNo, String noticeSdt, String noticeEdt, String popfile, String processState, String sexCd,
			String neuterYn, String specialMark, String careNm, String careTel, String careAddr, String orgNm,
			String chargeNm, String officetel, String noticeComment);

	public void alert_item_write(String total_id, String user_id, String atcid, String fdSbjt, String fdSn,
			String prdtClNm, String fdPrdtNm, String fdYmd, String depPlace, String rnum, String clrNm,
			String fdFilePathImg, String addr);

	public void alert_item_write2(String total_id, String user_id, String atcid, String fdSbjt, String fdSn,
			String prdtClNm, String fdPrdtNm, String fdYmd, String depPlace, String rnum, String clrNm,
			String fdFilePathImg, String addr);

	public void alert_animal_write(String total_id, String user_id, String desertionNo, String filename,
			String happenDt, String happenPlace, String kindCd, String colorCd, String age, String weight,
			String noticeNo, String noticeSdt, String noticeEdt, String popfile, String processState, String sexCd,
			String neuterYn, String specialMark, String careNm, String careTel, String careAddr, String orgNm,
			String chargeNm, String officetel, String noticeComment);

	public void alert_animal_write2(String total_id, String user_id, String desertionNo, String filename,
			String happenDt, String happenPlace, String kindCd, String colorCd, String age, String weight,
			String noticeNo, String noticeSdt, String noticeEdt, String popfile, String processState, String sexCd,
			String neuterYn, String specialMark, String careNm, String careTel, String careAddr, String orgNm,
			String chargeNm, String officetel, String noticeComment);

	public ArrayList<matchingAlarmDto> alert_item_list(String id);
	
	public LastDataCheckDto getlastcheck(String type);
	
	public void updatePrimeID(String primeID,String type);
	
	public void updateStatus(String status,String type);
	
	
	
	
	

}