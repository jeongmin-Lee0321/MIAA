package com.tech.miaa.dao;

import java.util.ArrayList;

import com.tech.miaa.dto.InquiryDto;

public interface InquiryDao {

	public void inquiry_wirte(String id, String title, String content, String file);
	public ArrayList<InquiryDto> inquiry_list(String id);
	
	
}
