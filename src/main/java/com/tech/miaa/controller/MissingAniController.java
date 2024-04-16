package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.service.MissingAnimalService;
import com.tech.miaa.serviceInter.MissingAnimalServiceInter;

@Controller
public class MissingAniController {
	@Autowired
	private SqlSession sqlSession;

	MissingAnimalServiceInter animalService;
	@RequestMapping("missing_ani_search_page")
	public String missing_ani_search_page(HttpServletRequest request, Model model) {
		return "missing_ani.search_page.실종동물 상세검색.3";
	}

	@RequestMapping("missing_ani_write_page")
	public String missing_ani_write_view(Model model, @SessionAttribute(name = "userId", required = false) String userId){
		String result = "";
			if (userId != null) {
				result = "missing_ani.write_page.실종동물 등록페이지.2";
			}else if (userId == null) {
				System.out.println("로그인 해야만 작성이 가능합니다.");
				result = "login.loginform_page.로그인페이지.1";
			}
		return result;
	}

	@RequestMapping("missing_ani_write")
	public String missing_ani_write(HttpServletRequest request, Model model,
			@RequestParam("files") ArrayList<MultipartFile> files) {
		model.addAttribute("request", request); model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("files", files);

		animalService = new MissingAnimalService();
		String result=animalService.missing_ani_write(model);
		return result;
	}
	
//	김영빈 실종동물 수정페이지
	@RequestMapping("missing_ani_modify_page")
	public String missing_ani_modify_page(Model model, @SessionAttribute(name = "userId", required = false) String userId){
		String result = "";
				result = "missing_ani.modify_page.실종동물 수정.2";
		return result;
	}
	
	//JeongMin
	@RequestMapping(value = "/missing_ani_detail_page", method = RequestMethod.GET)
	public String missing_ani_detail_page(HttpServletRequest request, Model model ) {

		return "missing_ani.detail_page.보호동물 상세페이지.2";
	}
}
