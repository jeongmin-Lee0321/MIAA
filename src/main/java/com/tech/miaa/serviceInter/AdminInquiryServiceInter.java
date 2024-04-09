package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.AdminInquiryDto;
import com.tech.miaa.vopage.PageVO;

public interface AdminInquiryServiceInter {
	public void inquiry_list(Model model);
	public void get_pagevo(Model model);
	
}
