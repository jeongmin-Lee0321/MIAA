package com.tech.miaa.dao;

import java.util.ArrayList;

import com.tech.miaa.dto.InquiryDto;

public interface InquiryDao {

	public void inquiry_wirte(String id, String title, String content, String file);
	
	public ArrayList<InquiryDto> inquiry_list(String id);
	
	public InquiryDto modify_list(String board_num, String id);

	public void delete(String string, String id);

	public void inquiry_modify(String num, String id, String title, String content, String file);

	public void inquiry_modify_present(String num, String id, String title, String content, String file_hidden);

	
	
	
}
