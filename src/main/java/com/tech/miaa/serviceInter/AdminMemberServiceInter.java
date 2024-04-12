package com.tech.miaa.serviceInter;

import org.springframework.ui.Model;

public interface AdminMemberServiceInter {
	public String admin_join(Model model);
	public int admin_idchek(Model model);
	public int admin_emailchk(Model model);
	public int admin_codechk(Model model);
}
