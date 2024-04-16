package com.tech.miaa.dao;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.AdminInquiryDto;
import com.tech.miaa.dto.AdminInquirySearchDto;
import com.tech.miaa.vopage.PageVO;

public interface AdminInquiryDao {

	public Integer get_total(AdminInquirySearchDto dto);
	public ArrayList<AdminInquiryDto> join_inquiry_list(AdminInquirySearchDto dto);
	public AdminInquiryDto inquiry_write_page(String bn);
	public int inquiry_write1(String board_num, String id, String board_reply);
	public int inquiry_write2(String board_num);
}
