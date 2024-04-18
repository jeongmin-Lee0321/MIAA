package com.tech.miaa.dao;

import com.tech.miaa.dto.AdminMemberDto;
import com.tech.miaa.dto.MemberDto;

import java.util.ArrayList;

public interface AdminMemberDao {
	public void admin_join(String id, String shpwd, String bcpwd,
	String email);
	public int admin_idcheck(String id);
	public int admin_emailcheck(String email);
	public int admin_login1(String id, String bcpwd);
	public AdminMemberDto admin_login2(String id, String bcpwd);
	public ArrayList<AdminMemberDto> getAdminMembers();
}
