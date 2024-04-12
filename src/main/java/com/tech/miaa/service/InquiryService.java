
package com.tech.miaa.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.tech.miaa.dao.InquiryDao;
import com.tech.miaa.dto.InquiryDto;
import com.tech.miaa.serviceInter.MypageCustomerInquiryServiceInter;
import com.tech.miaa.vopage.PageVO2;

public class InquiryService implements MypageCustomerInquiryServiceInter {
	
	private String filePath="C:\\23setspring\\springwork23\\MIAA\\src\\main\\webapp";

	@Override
	public void inquiry_wirte(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		
		String id = (String) session.getAttribute("userId");
		String title=request.getParameter("inquiry_title");
		String content=request.getParameter("inquiry_content");
		
		//해시맵에 파람값 등록 하여 dao실행
		HashMap<String, Object> map1= new HashMap<>();
		map1.put("userId", id);
		map1.put("inquiry_title", title);
		map1.put("inquiry_content", content);
		
		System.out.println(files);
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		for (int i = 0; i < files.size(); i++) {
			if(files.get(i).getOriginalFilename()=="") {
				continue;
			}else if(files.get(i).getOriginalFilename()!=""){
				try {
					UUID uuid=UUID.randomUUID();
					String fileName="resources/inquiry_img/"+uuid+"_"+files.get(i).getOriginalFilename();
					File saveFile = new File(filePath, fileName);
					files.get(i).transferTo(saveFile);
					map1.put("inquiry_file", uuid+"_"+files.get(i).getOriginalFilename());
					/* dao.imgUpLoad(id,(i+1),fileName); */
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		dao.inquiry_wirte(map1);
		
		//시퀀스로 생성한 board_num으로 admin_inquiry 테이블에도 작성
		System.out.println("시퀀스넘버:"+map1.get("board_num"));
		dao.admin_inquiry_add(map1);
		
	}
	@Override
	public ArrayList<InquiryDto> inquiry_list(Model model,PageVO2 pageVO2) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String getRowStart = pageVO2.getRowStart().toString();
		String getRowEnd = pageVO2.getRowEnd().toString();
		String id = (String) session.getAttribute("userId");
		
		
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		ArrayList<InquiryDto> list=null;
		try {
			list = dao.inquiry_list(id,getRowStart,getRowEnd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	@Override
	public void delete(String string, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String id = (String) session.getAttribute("userId");
		
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		dao.delete(string,id);
		
	}
	@Override
	public InquiryDto modify_list(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String board_num=request.getParameter("board_num");
		String id = (String) session.getAttribute("userId");
		
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		InquiryDto list=null;
		try {
			list = dao.modify_list(board_num,id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public InquiryDto detail_list(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		
		String board_num=request.getParameter("board_num");
		String id = (String) session.getAttribute("userId");
		
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		InquiryDto list=null;
		try {
			list = dao.detail_list(board_num,id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public void inquiry_modify(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpSession session=request.getSession();
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		
	
		String num = request.getParameter("inquiry_num");
		String id = (String) session.getAttribute("userId");
		String title=request.getParameter("inquiry_title");
		String content=request.getParameter("inquiry_content");
		InquiryDao dao = sqlSession.getMapper(InquiryDao.class);
		for (int i = 0; i < files.size(); i++) {
			if(files.get(i).getOriginalFilename()=="") {
				continue;
			}else if(files.get(i).getOriginalFilename()!=""){
				try {
					UUID uuid=UUID.randomUUID();
					String fileName="resources/inquiry_img/"+uuid+"_"+files.get(i).getOriginalFilename();
					File saveFile = new File(filePath, fileName);
					files.get(i).transferTo(saveFile);
					
					String file = uuid+"_"+files.get(i).getOriginalFilename();
					System.out.println(file);
					dao.inquiry_modify(num,id,title,content,file);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
}
	}
