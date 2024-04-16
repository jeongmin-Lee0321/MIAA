
package com.tech.miaa.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.dao.MissingAnimalDao;
import com.tech.miaa.serviceInter.MissingAnimalServiceInter;

public class MissingAnimalService implements MissingAnimalServiceInter {

	@Override
	public String missing_ani_write(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		String result="redirect:missing_ani_write_page"; 
//		MissingAnimalDao dao = sqlSession.getMapper(MissingAnimalDao.class);
		
		String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String openclose=request.getParameter("openclose"); String Missingday=request.getParameter("Missingday");
		String address=request.getParameter("address"); String animalname=request.getParameter("animalname");
		String animalkind1=request.getParameter("animalkind1"); String animalkind2=request.getParameter("animalkind2");
		String sexCd=request.getParameter("sexCd"); String age=request.getParameter("age"); 
		String colorCd="";
		if(!request.getParameter("colorCd").equals("색상을 선택하세요")) {
			colorCd=request.getParameter("colorCd"); 
		}
		String sepcialMark=request.getParameter("sepcialMark");
		String userId=request.getParameter("userId"); String addressCode=request.getParameter("addressCode");
		
		System.out.println(tel);
		System.out.println(openclose);
		System.out.println(Missingday);
		System.out.println(address);
		System.out.println(animalname);
		System.out.println(animalkind1);
		System.out.println(animalkind2);
		System.out.println(sexCd);
		System.out.println(colorCd);
		System.out.println(sepcialMark);
		System.out.println(userId);
		System.out.println(addressCode);
		
		return result;
	}
}
