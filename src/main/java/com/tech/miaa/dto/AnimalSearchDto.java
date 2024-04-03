package com.tech.miaa.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AnimalSearchDto {
	private String search_str_date;
	private String search_end_date;
	private String sidoSelectBox;
	private String sigunguSelectBox;
	private String shelterSelectBox;
	private String upKindSelectBox;
	private String kindSelectedBox;
	private String sexSelectedBox;
}
