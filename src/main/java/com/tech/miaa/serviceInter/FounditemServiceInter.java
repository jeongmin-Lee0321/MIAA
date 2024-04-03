package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.FounditemDto;

public interface FounditemServiceInter {
	public String found_item_search_AreaPd(Model model);
	public String found_item_search_Place(Model model);
	public ArrayList<FounditemDto> getlstList(String ResultCode,String select);
	public int getTotal();
}
