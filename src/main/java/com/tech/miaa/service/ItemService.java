
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
import com.tech.miaa.dto.ItemImgDto;
import com.tech.miaa.serviceInter.ItemServiceInter;

public class ItemService implements ItemServiceInter {
	
	private String filePath="C:\\23setspring\\springwork23\\MIAA\\src\\main\\webapp";
	
	@Override
	public String lost_item_write(Model model){
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		String result=""; ItemDao dao = sqlSession.getMapper(ItemDao.class);
		int cnt=1;
		
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
		System.out.println(files.size());
		
		if(lostday.equals("")|| address.equals("")|| itemname.equals("") || itemkind2.equals("중분류") || colorCd.equals("색상을 선택하세요")) {
			System.out.println("필수 입력란을 모두 기입하세요.");
			result="redirect:lost_item_write_page";
		}else {
			dao.itemWrite(tel, openclose, lostday, address, itemname, itemkind1, itemkind2, colorCd, sepcialMark, userId);
			for (int i = 0; i < files.size(); i++) {
				if(files.get(i).getOriginalFilename()=="") {
					continue;
				}else if(files.get(i).getOriginalFilename()!=""){
					try {
						UUID uuid=UUID.randomUUID();
						String fileName="resources/item_img/"+uuid+"_"+files.get(i).getOriginalFilename();
						File saveFile = new File(filePath, fileName);
						files.get(i).transferTo(saveFile);
						dao.imgUpLoad(userId,(i+1),itemname,fileName);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			System.out.println("등록되었습니다.");
			result="redirect:lost_item_search_page";
		}
		return result;
	}

	@Override
	public ArrayList<ItemDto> lost_item_search(Model model) {
		Map<String, Object> map = model.asMap();
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		ArrayList<ItemDto> itemList = dao.itemlistview();
		ArrayList<ItemImgDto> imgDtoall=dao.lost_item_detail_imgall();
		int totalCount=dao.totalCount();
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("imgDtoall", imgDtoall);
		return itemList;
	}

	@Override
	public ItemDto lost_item_detail_page(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		String total_id = request.getParameter("total_id");
		
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		ItemDto dto = null; ArrayList<ItemImgDto> imgDtos=null;
		try {
			dto=dao.lost_item_detail_page(total_id);
			imgDtos=dao.lost_item_detail_img(total_id);
			//사진이 없을 때 기본아이콘 대체
			if (imgDtos.size()==0) {
				if(dto.getUpkind().equals("PRI000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/노트북.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRJ000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/휴대폰.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRH000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/지갑.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRG000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/전자기기.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRD000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/산업.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRO000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/보석.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRZ000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/기타물품.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRE000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/스포츠.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRF000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/자동차.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRL000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/현금.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRK000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/의류.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRQ000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/쇼핑백.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRR000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/악기.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRP000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/카드.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRM000")) {
					ItemImgDto imgdto = new ItemImgDto(0, 0, null, "resources/item_default/증권.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRN000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/증명서.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRA000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/가방.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRB000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/책.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRX000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/유류물품.png"); imgDtos.add(0, imgdto);
				}
			}
		} catch (Exception e) {}
		
		model.addAttribute("imgDtos", imgDtos);
		System.out.println(imgDtos.size());
		return dto;
	}

	private ItemImgDto Filename(String string) {
		// TODO Auto-generated method stub
		return null;
	}
}
