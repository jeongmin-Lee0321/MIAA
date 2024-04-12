package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tech.miaa.service.AdminMemberService;
import com.tech.miaa.service.MemberService;
import com.tech.miaa.serviceInter.AdminMemberServiceInter;
import com.tech.miaa.serviceInter.MemberServiceInter;

@Controller
public class AdminMemberController {
	@Autowired
	private SqlSession sqlSession;

	AdminMemberServiceInter adminMemberServiceInter;

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model,
			@SessionAttribute(name = "userId", required = false) String userId){

		String result = "redirect:/";

		if (userId != null) {
			System.out.println("로그인 유저의 id : " + userId);
		} else if (userId == null) {
			System.out.println("로그인 하지 않았습니다.");
		}
		result = "admin_login.joinform_page.관리자 회원가입.1";
		model.addAttribute("userId", userId);

		return result;

	}

	@RequestMapping("admin_join")
	public String join(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		adminMemberServiceInter = new AdminMemberService();

		String result = adminMemberServiceInter.admin_join(model);

		return result;
	}

	@ResponseBody
	@RequestMapping("admin_idcheck")
	public int idcheck(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		adminMemberServiceInter = new AdminMemberService();

		int num = adminMemberServiceInter.admin_idchek(model);

		return num;
	}

	@ResponseBody
	@RequestMapping("admin_emailchk")
	public int emailchk(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		adminMemberServiceInter = new AdminMemberService();

		int num = adminMemberServiceInter.admin_emailchk(model);

		return num;
	}

	@ResponseBody
	@RequestMapping("admin_codechk")
	public int admin_codechk(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("sqlSession", sqlSession);
		adminMemberServiceInter = new AdminMemberService();

		int num = adminMemberServiceInter.admin_codechk(model);

		return num;
	}
}
