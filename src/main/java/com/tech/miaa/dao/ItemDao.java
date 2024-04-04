package com.tech.miaa.dao;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.dto.ItemImgDto;

public interface ItemDao {
	public void imgUpLoad(String userId, int i, String itemname, String fileName);
	public void itemWrite(String tel,String openclose, String lostday,String address,String itemname,
			String itemkind1,String itemkind2,String colorCd,String sepcialMark,String userId);
	public ArrayList<ItemDto> itemlistview();
	public int totalCount();
	public ItemDto lost_item_detail_page(String total_id);
	public ArrayList<ItemImgDto> lost_item_detail_img(String total_id);
	public ArrayList<ItemImgDto> lost_item_detail_imgall();
}
