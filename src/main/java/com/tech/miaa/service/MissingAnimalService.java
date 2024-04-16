
package com.tech.miaa.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.dao.MissingAnimalDao;
import com.tech.miaa.dto.AnimalDto;
import com.tech.miaa.serviceInter.MissingAnimalServiceInter;
import com.tech.miaa.util.PrdCode;
import com.tech.miaa.vopage.PageVO;

public class MissingAnimalService implements MissingAnimalServiceInter {
	
	private String filePath="C:\\23setspring\\springwork23\\MIAA\\src\\main\\webapp";
	
	@Override
	public ArrayList<AnimalDto> missing_ani_search(Model model) {
		Map<String, Object> map = model.asMap();
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		PrdCode pc = new PrdCode();
		MissingAnimalDao dao = sqlSession.getMapper(MissingAnimalDao.class);
		
		//페이징 처리
		PageVO pageVo = new PageVO();
		int totalCount=dao.totalCount();
		String strPage=request.getParameter("page");
		if(strPage==null) {strPage="1";}
		int page=Integer.parseInt(strPage);
		pageVo.setPage(page);
		pageVo.pageCalculate(totalCount);
		int rowStart=pageVo.getRowStart();
		int rowEnd=pageVo.getRowEnd();
		
		ArrayList<AnimalDto> animalList = dao.animalListView(rowStart,rowEnd);
		
		//사진이 없을 때 기본이미지로 대체
		for (int i = 0; i < animalList.size(); i++) {
			if(animalList.get(i).getFilename()==null) {
				if(animalList.get(i).getUpkind().equals("417000")) {
					animalList.get(i).setFilename("resources/ani_default/강아지.png");
				}else if(animalList.get(i).getUpkind().equals("422400")) {
					animalList.get(i).setFilename("resources/ani_default/고양이.png");
				}else if(animalList.get(i).getUpkind().equals("429900")) {
					animalList.get(i).setFilename("resources/ani_default/기타.png"); 
				}
			}
			String upkind="P"+animalList.get(i).getUpkind();
			animalList.get(i).setUpkind(pc.getPrdNameByCode(upkind));
			if(animalList.get(i).getUpr_cd()==null) {
				animalList.get(i).setUpr_cd("전체");
			}else{
				String upr_cd="C"+animalList.get(i).getUpr_cd();
				animalList.get(i).setUpr_cd(pc.getPrdNameByCode(upr_cd));
			}
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageVo", pageVo);
		return animalList;
	}
	
	@Override
	public String missing_ani_write(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		String result=""; 
		MissingAnimalDao dao = sqlSession.getMapper(MissingAnimalDao.class);
		
		String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String openclose=request.getParameter("openclose"); String Missingday=request.getParameter("Missingday");
		String address=request.getParameter("address"); String animalname=request.getParameter("animalname");
		String animalkind1=request.getParameter("animalkind1"); String animalkind2=request.getParameter("animalkind2");
		String age=request.getParameter("age");
		String sepcialMark=request.getParameter("sepcialMark"); String userId=request.getParameter("userId"); 
		String addressCode1=request.getParameter("addressCode1"); String addressCode2=request.getParameter("addressCode2");
		
		if(Missingday.equals("")|| address.equals("")|| animalname.equals("") || animalkind1.equals("축종을 선택하세요") || 
				addressCode1.equals("지역을 선택하세요")) {
			System.out.println("필수 입력란을 모두 기입하세요.");
			result="redirect:missing_ani_write_page";
		}else {
			dao.animalWrite(tel, openclose, Missingday, address, animalname, animalkind1, animalkind2,
					age, sepcialMark, userId, addressCode1, addressCode2);
			for (int i = 0; i < files.size(); i++) {
				if(files.get(i).getOriginalFilename()=="") {
					continue;
				}else if(files.get(i).getOriginalFilename()!=""){
					try {
						UUID uuid=UUID.randomUUID();
						String fileName="resources/ani_img/"+uuid+"_"+files.get(i).getOriginalFilename();
						File saveFile = new File(filePath, fileName);
						files.get(i).transferTo(saveFile);
						dao.imgUpLoad(userId,(i+1),animalname,fileName,animalkind1);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			System.out.println("등록되었습니다.");
			result="redirect:missing_ani_search_page";
		}
		return result;
	}

	
}
