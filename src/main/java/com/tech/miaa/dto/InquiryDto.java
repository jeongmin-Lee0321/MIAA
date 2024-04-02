package com.tech.miaa.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InquiryDto {
	private String inquiry_id;
	private String inquiry_title;
	private String inquiry_content;
	private String inquiry_file;	
}
