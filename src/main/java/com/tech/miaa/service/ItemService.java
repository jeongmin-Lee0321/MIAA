
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

import com.tech.miaa.dao.ItemDao;
import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.serviceInter.ItemServiceInter;

public class ItemService implements ItemServiceInter {
	
	private String filePath="C:\\23setspring\\springwork23\\MIAA\\src\\main\\webapp\\resources\\item_img";
	
	@Override
	public String lost_item_write(Model model){
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		String result=""; ItemDao dao = sqlSession.getMapper(ItemDao.class);
		
		String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String openclose=request.getParameter("openclose");
		String lostday=request.getParameter("lostday");
		String address=request.getParameter("address");
		String itemname=request.getParameter("itemname");
		String itemkind1=request.getParameter("itemkind1");
		String itemkind2=request.getParameter("itemkind2");
		String colorCd=request.getParameter("colorCd");
		String sepcialMark=request.getParameter("sepcialMark");
		String userId=request.getParameter("userId");
		
		
		if(lostday.equals("")|| address.equals("")|| itemname.equals("") || itemkind2.equals("중분류") || colorCd.equals("색상을 선택하세요")) {
			System.out.println("필수 입력란을 모두 기입하세요.");
			result="redirect:lost_item_write_page";
		}else {
			dao.itemWrite(tel, openclose, lostday, address, itemname, itemkind1, itemkind2, colorCd, sepcialMark, userId);
			for (int i = 0; i < files.size(); i++) {
				if(files.get(i).getOriginalFilename()=="") {
					continue;
				}else {
					try {
						UUID uuid=UUID.randomUUID();
						String fileName=uuid+"_"+files.get(i).getOriginalFilename();
						File saveFile = new File(filePath, fileName);
						files.get(i).transferTo(saveFile);
						dao.imgUpLoad(userId,itemname,fileName);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			System.out.println("등록되었습니다.");
			result="redirect:/";
		}
		return result;
	}

	@Override
	public ArrayList<ItemDto> lost_item_search(Model model) {
		Map<String, Object> map = model.asMap();
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		ArrayList<ItemDto> itemList = dao.itemlistview();
		
		return itemList;
	}
}
