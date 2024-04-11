package com.tech.miaa.dao;

import java.util.ArrayList;

import com.tech.miaa.dto.AdminInquiryDto;

public interface AdminInquiryDao {

	public ArrayList<AdminInquiryDto> join_inquiry_list(int rowStart,int rowEnd);
	public Integer get_total();
}
