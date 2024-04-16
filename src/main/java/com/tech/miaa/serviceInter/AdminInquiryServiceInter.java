package com.tech.miaa.serviceInter;

import org.springframework.ui.Model;

import com.tech.miaa.dto.AdminInquirySearchDto;
import com.tech.miaa.vopage.PageVO;

public interface AdminInquiryServiceInter {
	public void inquiry_list(Model model,PageVO pageVo);
	public PageVO get_pagevo(Model model,PageVO pageVo);
	public void set_search_dto(Model model, PageVO pageVo);
	public void delete(Model model,PageVO pageVo);
	public void inquiry_write_page(Model model);
	public void inquiry_write(Model model);
}
