package com.tech.miaa.serviceInter;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.miaa.vopage.PageVO;

public interface AdminMainDataServiceInter {
	public void get_main_data(Model model);
}
