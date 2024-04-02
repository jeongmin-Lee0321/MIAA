package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.FounditemDto;

public interface FounditemServiceInter {
	public ArrayList<FounditemDto> found_item_search(Model model);
}
