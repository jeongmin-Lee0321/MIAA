package com.tech.miaa.serviceInter;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.tech.miaa.dto.InquiryDto;

public interface MypageCustomerInquiryServiceInter {
	public void inquiry_wirte(Model model);
	public ArrayList<InquiryDto> inquiry_list(Model model);
	public InquiryDto modify_list(Model model);
	public InquiryDto detail_list(Model model);
	public void inquiry_modify(Model model);
	public void delete(String string, Model model);
	
}
