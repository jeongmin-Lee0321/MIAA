package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.FounddetailDto;
import com.tech.miaa.dto.FounditemDto;

public interface FounditemServiceInter {
	public String found_item_search_AreaPd(Model model);
	public String found_item_search_Place(Model model);
	public FounddetailDto found_item_detailview(String atcid,String fdSn);
	public ArrayList<FounditemDto> getFoundList(String rsCode);
	public int getTotal();
	
}
