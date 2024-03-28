package com.tech.miaa.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AnimalDto {
	private String total_id;
	private String animal_id;
	private String user_tel;
	private String openclose;
	private String lostday;
	private String address;
	private String animal_name;
	private String upkind;
	private String upr_cd;
	private String sexcd;
	private String colorcd;
	private int age;
	private String sepcialmark;
	private String user_id;
	private Date animal_date;
}
