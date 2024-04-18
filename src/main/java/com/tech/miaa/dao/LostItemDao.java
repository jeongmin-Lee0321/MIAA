package com.tech.miaa.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.dto.ItemImgDto;
import com.tech.miaa.dto.ItemSearchDto;

public interface LostItemDao {
	public void imgUpLoad(String userId,int i, String itemname, String fileName,String itemkind2);
	public void itemWrite(String tel,String openclose, String lostday,String address,String itemname,
			String itemkind1,String itemkind2,String colorCd,String sepcialMark,String userId,String addressCode);
	public int totalCount(@Param("searchday1")String searchday1, @Param("searchday2")String searchday2, 
			@Param("addressCode") String addressCode, @Param("itemkind1")String itemkind1, @Param("itemkind2")String itemkind2, 
			@Param("colorCd")String colorCd);
	public ItemDto lost_item_detail_page(String total_id);
	public ArrayList<ItemImgDto> lost_item_detail_img(String total_id);
	public void lost_item_delete_img(String total_id);
	public void lost_item_delete_content(String total_id);
	public void lost_item_modify(String tel, String openclose, String lostday, String address, String itemname,
			String upkind, String upr_cd, String colorCd, String sepcialMark, String addressCode, String total_id);
	public ArrayList<ItemDto> get_lost_items(String userId);
	public ArrayList<ItemDto> itemlistview(@Param("searchday1")String searchday1, @Param("searchday2")String searchday2, 
			@Param("addressCode") String addressCode, @Param("itemkind1")String itemkind1, @Param("itemkind2")String itemkind2, 
			@Param("colorCd")String colorCd, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	/* 원진호_0417추가*/
//	public void alert_item_write(int total_id,String user_id,String atcid,String fdSbjt,String fdSn,String prdtClNm,String fdPrdtNm,
//			String fdYmd,String depPlace,String rnum,String clrNm,String fdFilePathImg,String addr);
	public void alert_item_write(int total_id,String user_id,String atcid,String fdSbjt,String fdSn,String prdtClNm,String fdPrdtNm,
			String fdYmd,String depPlace,String rnum,String clrNm,String fdFilePathImg,String addr);
	public void alert_item_select(int total_id,String user_id);
	
}