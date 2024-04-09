package com.tech.miaa.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tech.miaa.dto.InquiryDto;

public interface InquiryDao {

	public void inquiry_wirte(HashMap<String,Object> map1);
	
	public ArrayList<InquiryDto> inquiry_list(String id);

	public void delete(String string, String id);

	public void admin_inquiry_add(HashMap<String,Object> map1);
	
	
}
