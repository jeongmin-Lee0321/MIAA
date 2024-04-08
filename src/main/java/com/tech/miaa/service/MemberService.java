
package com.tech.miaa.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.dao.AdminMemberDao;
import com.tech.miaa.dao.MemberDao;
import com.tech.miaa.dto.AdminMemberDto;
import com.tech.miaa.dto.MemberDto;
import com.tech.miaa.serviceInter.MemberServiceInter;
import com.tech.miaa.util.CryptoUtil;

public class MemberService implements MemberServiceInter {

	@Override
	public int idchek(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");

		String id = request.getParameter("id");
		int num=0;
		if(id=="") {
			num=-1;
		}else{
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			num = dao.idcheck(id);
		}
		return num;
	}

	@Override
	public int emailchk(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");

		String email = request.getParameter("email");
		int num = 0;

		if (email == "") {
			num = -1;
		} else {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			num = dao.emailcheck(email);
		}

		return num;
	}
	
	@Override
	public String searchid(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");

		String email = request.getParameter("email");

		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		String fineid = dao.searchid(email);
		return fineid;
	}

	@Override
	public String searchpw(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");

		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pw = "";
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		String user_bcpwd = dao.searchpw1(id, email);
		String user_shpwd = dao.searchpw2(id, email);
		//비밀번호 복호화
		try {
			pw = CryptoUtil.decryptAES256(user_bcpwd, user_shpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pw;
	}

	@Override
	public String join(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); String pw2 = request.getParameter("pw2");
		String shpwd = ""; String bcpwd = "";
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		String result = "redirect:joinform";
		
		// 암호화 처리
		try {
			shpwd = CryptoUtil.sha512(pw);
			bcpwd = CryptoUtil.encryptAES256(pw, shpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(bcpwd);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int idcheck = dao.idcheck(id);
		int emailcheck = dao.emailcheck(email);
		
		if (id != "" && email != "" && postcode != "" && pw != "") {
			// 가입가능여부 확인 (아이디, 이메일 중복확인)
			if (idcheck >= 1 && emailcheck >= 1) {
				System.out.println("아이디와 이메일이 중복됩니다.");
			} else if (idcheck == 0 && emailcheck >= 1) {
				System.out.println("이메일이 중복됩니다.");
			} else if (idcheck >= 1 && emailcheck == 0) {
				System.out.println("아이디가 중복됩니다.");
			} else {
				// 가입가능여부 확인 (비밀번호와 비밀번호 확인 같은지 확인)
				if (pw.equals(pw2)) {
					System.out.println("회원가입을 축하드립니다.");
					dao.join(id, shpwd, bcpwd, email, postcode, address, detailAddress);
					result = "redirect:loginform";
				} else {
					System.out.println("비밀번호를 확인해주세요.");
				}
			}
		}
		return result;
	}
	
	@Override
	public String modify_account(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String id = (String) session.getAttribute("userId");
		String pw = request.getParameter("pw"); String pw2 = request.getParameter("pw2");
		String shpwd = ""; String bcpwd = "";
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		String result = "redirect:mypageform";
		
		try {
			shpwd = CryptoUtil.sha512(pw);
			bcpwd = CryptoUtil.encryptAES256(pw, shpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(bcpwd);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.modify_account(id, shpwd, bcpwd, email, postcode, address, detailAddress);
		
		return result;
	}
	
	@Override
	public String del_account(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String pw = request.getParameter("pw");
		String shpwd = ""; String bcpwd = "";
		String result = "redirect:/";
		String id = (String) session.getAttribute("userId");
		
		
		// 암호화 처리
		try {
			shpwd = CryptoUtil.sha512(pw);
			bcpwd = CryptoUtil.encryptAES256(pw, shpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.del_account(bcpwd, id);
		
		return result;
	}

	@Override
	public String login(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session = null; MemberDto dto=null;
		String id = request.getParameter("id"); String pw = request.getParameter("pw");
		String shpwd = ""; String bcpwd = ""; String result = "redirect:loginform";
		AdminMemberDto admin_dto= null;
		
		//로그인 비밀번호 아이디 공백 확인
		if (id == "" && pw == "") {
			System.out.println("아이디와 비밀번호를 입력하세요");
		} else if (id == "" && pw != "") {
			System.out.println("아이디를 입력하세요");
		} else if (id != "" && pw == "") {
			System.out.println("비밀번호를 입력하세요");
		} else {
			//복호화 작업
			try {
				shpwd = CryptoUtil.sha512(pw);
				bcpwd = CryptoUtil.encryptAES256(pw, shpwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			
			//추가 및 변경 김영빈 - 관리자 아이디인지 확인
			AdminMemberDao admin_dao=sqlSession.getMapper(AdminMemberDao.class);
			
			int isAdmin = admin_dao.admin_login1(id, bcpwd);
			switch (isAdmin) {
			case 1:
				//아이디와 비밀번호 일치하는지 확인
				if (isAdmin > 0) {
					//일치하면 dto에 회원정보 저장 후 세션에 유저아이디를 저장
					admin_dto = admin_dao.admin_login2(id, bcpwd);
					session = request.getSession(false);
					//---로그인아이디가 관리자일경우 isAdmin에 admin이라고 저장---
					session.setAttribute("isAdmin", "admin");
					
					session.setAttribute("userId", admin_dto.getUser_id());
					session.setMaxInactiveInterval(1800);
					
					
					result = "redirect:/";
				} else if (isAdmin == 0) {
					System.out.println("아이디와 비밀번호를 확인하세요.");
				}
				
				break;

			default:
				//일반 유저일경우
				//아이디와 비밀번호 일치하는지 확인
				int num = dao.login1(id, bcpwd);
				if (num > 0) {
					//일치하면 dto에 회원정보 저장 후 세션에 유저아이디를 저장
					dto = dao.login2(id, bcpwd);
					session = request.getSession(false);
					session.setAttribute("userId", dto.getUser_id());
					session.setMaxInactiveInterval(1800);
					
					
					result = "redirect:/";
				} else if (num == 0) {
					System.out.println("아이디와 비밀번호를 확인하세요.");
				}
				break;
			}
		}
		return result;
	}
}
