package com.tech.miaa.dao;

import com.tech.miaa.dto.MemberDto;

public interface MemberDao {
	public void join(String id, String shpwd, String bcpwd,
	String email, String postcode, String address, String detailAddress);
	public int idcheck(String id);
	public int emailcheck(String email);
	public String searchid(String email);
	public String searchpw1(String id, String email);
	public String searchpw2(String id, String email);
	public int login1(String id, String bcpwd);
	public MemberDto login2(String id, String bcpwd);
}
