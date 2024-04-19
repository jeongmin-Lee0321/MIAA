package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypagePostController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("mypage_post_list_page")
	public String mypage_post_list_page(HttpServletRequest request, Model model) {
		return "mypage_post.list_page.등록 게시물.3";
	}
	
}