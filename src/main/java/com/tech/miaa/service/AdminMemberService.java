
package com.tech.miaa.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.AdminMemberDao;
import com.tech.miaa.dao.MemberDao;
import com.tech.miaa.dto.MemberDto;
import com.tech.miaa.serviceInter.AdminMemberServiceInter;
import com.tech.miaa.util.CryptoUtil;

public class AdminMemberService implements AdminMemberServiceInter {

	@Override
	public int admin_idchek(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");

		String id = request.getParameter("id");
		int num=0;
		if(id=="") {
			num=-1;
		}else{
			AdminMemberDao dao = sqlSession.getMapper(AdminMemberDao.class);
			num = dao.admin_idcheck(id);
		}
		return num;
	}

	@Override
	public int admin_emailchk(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");

		String email = request.getParameter("email");
		int num = 0;

		if (email == "") {
			num = -1;
		} else {
			AdminMemberDao dao = sqlSession.getMapper(AdminMemberDao.class);
			num = dao.admin_emailcheck(email);
		}

		return num;
	}
	
//	admin_codeck 관리자가입 코드 Aldkxptmxm
	@Override
	public int admin_codechk(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		//인증코드
		String code = request.getParameter("code");
		int num = 0;

		if (code == "") {
			num = -1; //값없을 경우 -1
		} else if(code.equals("Aldkxptmxm")) {
			num = 0; // 맞을경우 0 
		} else {
			num = 1; // 틀릴경우 -1
		}

		return num;
	}
	
	@Override
	public String admin_join(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); String pw2 = request.getParameter("pw2");
		String shpwd = ""; String bcpwd = "";
		String email = request.getParameter("email");
//		인증코드
		String code = request.getParameter("code");
		
		String result = "redirect:admin";
		
		// 암호화 처리
		try {
			shpwd = CryptoUtil.sha512(pw);
			bcpwd = CryptoUtil.encryptAES256(pw, shpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(bcpwd);
		AdminMemberDao dao = sqlSession.getMapper(AdminMemberDao.class);
		int idcheck = dao.admin_idcheck(id);
		int emailcheck = dao.admin_emailcheck(email);
		//인증코드체크
		int codecheck= admin_codechk(model);
		
		switch (codecheck) {
		case 0 :
			if (id != "" && email != "" && pw != "") {
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
						System.out.println("관리자 가입 완료.");
						dao.admin_join(id, shpwd, bcpwd, email);
						result = "redirect:loginform";
					} else {
						System.out.println("비밀번호를 확인해주세요.");
					}
				}
			}
			break;
		case -1 :
			System.out.println("인증코드가 틀렸습니다");
		default:
			System.out.println("인증코드를 확인해주세요");
			break;
		}
		
		return result;
	}
	

}
