package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.AnimalDto;

public interface MissingAnimalServiceInter {
	public String missing_ani_write(Model model);
	public ArrayList<AnimalDto> missing_ani_search(Model model);
	public AnimalDto missing_ani_detail_page(Model model);
}
