package com.tech.miaa.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tech.miaa.dto.InquiryDto;

public interface InquiryDao {

	public void inquiry_wirte(HashMap<String,Object> map1);
	
	public ArrayList<InquiryDto> inquiry_list(String id, String getRowStart, String getRowEnd);
	
	public InquiryDto modify_list(String board_num, String id);
	
	public InquiryDto detail_list(String board_num, String id);

	public void delete(String string, String id);


	public void inquiry_modify(String num, String id, String title, String content, String file);

	public void inquiry_modify_present(String num, String id, String title, String content, String file_hidden);

	public Integer total();

	
		

	public void admin_inquiry_add(HashMap<String,Object> map1);
	
	

}
