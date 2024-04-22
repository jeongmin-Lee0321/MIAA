package com.tech.miaa.dao;

import com.tech.miaa.dto.MemberDto;
import com.tech.miaa.dto.MypagePostDto;

import java.util.ArrayList;
import java.util.List;

public interface MypagePostDao {
	public ArrayList<MypagePostDto> mypage_post_list_page(String userId);
}
