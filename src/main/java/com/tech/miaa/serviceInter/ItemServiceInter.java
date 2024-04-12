package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.dto.ItemDto;

public interface ItemServiceInter {
	public ArrayList<ItemDto> lost_item_search(Model model);
	public String lost_item_write(Model model);
	public ItemDto lost_item_detail_page(Model model);
}
