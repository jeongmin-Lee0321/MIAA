package com.tech.miaa.serviceInter;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tech.miaa.dto.MemberDto;

public interface MemberServiceInter {
	public String join(Model model);
	public String del_account(Model model);
	public int idchek(Model model);
	public int emailchk(Model model);
	public String searchid(Model model);
	public String searchpw(Model model);
	public String login(Model model);
}
