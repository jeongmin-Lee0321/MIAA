package com.tech.miaa.dto;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.util.PrdCode.Prd;

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
	private String addressCode;
	private String total_id1;
	private String filename;
}
