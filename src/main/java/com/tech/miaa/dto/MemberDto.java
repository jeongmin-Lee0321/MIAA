package com.tech.miaa.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
	private String user_id;
	private String user_shpwd;
	private String user_bcpwd;
	private String user_email;
	private int user_postcode;
	private String user_address;
	private String user_detailaddress;
}
