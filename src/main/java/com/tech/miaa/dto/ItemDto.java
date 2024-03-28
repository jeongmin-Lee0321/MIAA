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
public class ItemDto {
	private String total_id;
	private String item_id;
	private String user_tel;
	private String openclose;
	private String lostday;
	private String address;
	private String item_name;
	private String upkind;
	private String upr_cd;
	private String colorcd;
	private String sepcialmark;
	private String user_id;
	private Date item_date;
}
