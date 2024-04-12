package com.tech.miaa.dao;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.AdminInquiryDto;
import com.tech.miaa.dto.AdminInquirySearchDto;
import com.tech.miaa.vopage.PageVO;

public interface AdminInquiryDao {


	public ArrayList<AdminInquiryDto> join_inquiry_list(int rowStart,int rowEnd);
	public Integer get_total();
}
