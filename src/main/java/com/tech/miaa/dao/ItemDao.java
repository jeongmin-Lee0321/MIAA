package com.tech.miaa.dao;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.dto.ItemDto;

public interface ItemDao {
	public void itemWrite(String tel,String openclose, String lostday,String address,String itemname,
			String itemkind1,String itemkind2,String colorCd,String sepcialMark,String userId, MultipartFile file);
	public ArrayList<ItemDto> itemlistview();
}
