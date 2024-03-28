
package com.tech.miaa.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.AnimalDao;
import com.tech.miaa.serviceInter.AnimalServiceInter;

public class AnimalService implements AnimalServiceInter {

	@Override
	public String missing_ani_write(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		String result="";
		
		String tel=request.getParameter("tel");
		String openclose=request.getParameter("openclose");
		String lostday=request.getParameter("lostday");
		String address=request.getParameter("address");
		String animalname=request.getParameter("animalname");
		String animalkind1=request.getParameter("animalkind1");
		String animalkind2=request.getParameter("animalkind2");
		String sexCd=request.getParameter("sexCd");
		String colorCd=request.getParameter("colorCd");
		String age=request.getParameter("age");
		String sepcialMark=request.getParameter("sepcialMark");
		String userId=request.getParameter("userId");
		
		if(lostday=="" || address==""|| animalname=="" || animalkind2=="") {
			System.out.println("필수 입력란을 모두 기입하세요.");
			result="redirect:missing_ani_write_view";
		}else {
			AnimalDao dao = sqlSession.getMapper(AnimalDao.class);
			dao.animalWrite(tel,openclose,lostday,address,animalname,animalkind1,animalkind2,sexCd,colorCd,age,sepcialMark,userId);
			System.out.println("등록되었습니다.");
			result="redirect:/";
		}
		return result;
	}
}
