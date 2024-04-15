package com.tech.miaa.dao;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.dto.ItemImgDto;

public interface LostItemDao {
	public void imgUpLoad(String userId,int i, String itemname, String fileName,String itemkind2);
	public void itemWrite(String tel,String openclose, String lostday,String address,String itemname,
			String itemkind1,String itemkind2,String colorCd,String sepcialMark,String userId,String addressCode);
	public ArrayList<ItemDto> itemlistview(int rowStart,int rowEnd);
	public int totalCount();
	public ItemDto lost_item_detail_page(String total_id);
	public ArrayList<ItemImgDto> lost_item_detail_img(String total_id);
	public void lost_item_delete_img(String total_id);
	public void lost_item_delete_content(String total_id);
	public void lost_item_modify(String tel, String openclose, String lostday, String address, String itemname,
			String upkind, String upr_cd, String colorCd, String sepcialMark, String addressCode, String total_id);
}