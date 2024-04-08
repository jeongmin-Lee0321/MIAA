
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
import com.tech.miaa.vopage.PageVO;

public class ItemService implements ItemServiceInter {
	
	private String filePath="C:\\23setspring\\springwork23\\MIAA\\src\\main\\webapp";
	
	@Override
	public String lost_item_write(Model model){
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		String result=""; ItemDao dao = sqlSession.getMapper(ItemDao.class);
		int cnt=1; String fileName="";
		
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
				}else if(files.get(i).getOriginalFilename()!=""){
					try {
						UUID uuid=UUID.randomUUID();
						fileName="resources/item_img/"+uuid+"_"+files.get(i).getOriginalFilename();
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
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		
		//페이지 처리
				PageVO pageVo = new PageVO();
				int totalCount=dao.totalCount();
				String strPage=request.getParameter("page");
				
				if(strPage==null) {strPage="1";}
				int page=Integer.parseInt(strPage);
				pageVo.setPage(page);
				
				pageVo.pageCalculate(totalCount);
				
				int rowStart=pageVo.getRowStart();
				int rowEnd=pageVo.getRowEnd();
				
		ArrayList<ItemDto> itemList = dao.itemlistview(rowStart,rowEnd);
		//사진이 없을 때 기본아이콘 대체
		for (int i = 0; i < itemList.size(); i++) {
			if(itemList.get(i).getFilename()==null) {
				if(itemList.get(i).getUpkind().equals("PRI000")) {
					itemList.get(i).setFilename("resources/item_default/노트북.png");
				}else if(itemList.get(i).getUpkind().equals("PRJ000")) {
					itemList.get(i).setFilename("resources/item_default/휴대폰.png");
				}else if(itemList.get(i).getUpkind().equals("PRH000")) {
					itemList.get(i).setFilename("resources/item_default/지갑.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRG000")) {
					itemList.get(i).setFilename("resources/item_default/전자기기.png");
				}else if(itemList.get(i).getUpkind().equals("PRD000")) {
					itemList.get(i).setFilename("resources/item_default/산업.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRO000")) {
					itemList.get(i).setFilename("resources/item_default/보석.png");
				}else if(itemList.get(i).getUpkind().equals("PRZ000")) {
					itemList.get(i).setFilename("resources/item_default/기타물품.png");
				}else if(itemList.get(i).getUpkind().equals("PRE000")) {
					itemList.get(i).setFilename("resources/item_default/스포츠.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRF000")) {
					itemList.get(i).setFilename("resources/item_default/자동차.png");
				}else if(itemList.get(i).getUpkind().equals("PRL000")) {
					itemList.get(i).setFilename("resources/item_default/현금.png");
				}else if(itemList.get(i).getUpkind().equals("PRK000")) {
					itemList.get(i).setFilename("resources/item_default/의류.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRQ000")) {
					itemList.get(i).setFilename("resources/item_default/쇼핑백.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRR000")) {
					itemList.get(i).setFilename("resources/item_default/악기.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRP000")) {
					itemList.get(i).setFilename("resources/item_default/카드.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRM000")) {
					itemList.get(i).setFilename("resources/item_default/증권.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRN000")) {
					itemList.get(i).setFilename("resources/item_default/증명서.png");
				}else if(itemList.get(i).getUpkind().equals("PRA000")) {
					itemList.get(i).setFilename("resources/item_default/가방.png"); 
				}else if(itemList.get(i).getUpkind().equals("PRB000")) {
					itemList.get(i).setFilename("resources/item_default/책.png");
				}else if(itemList.get(i).getUpkind().equals("PRX000")) {
					itemList.get(i).setFilename("resources/item_default/유류물품.png");
				}
			}
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageVo", pageVo);
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
		return dto;
	}
	
	@Override
	public void lost_item_delete(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		String total_id = request.getParameter("total_id");
		System.out.println(total_id);
		
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		ArrayList<ItemImgDto> imgDtos=dao.lost_item_detail_img(total_id);
		
			if(imgDtos.size()!=0) {
				for (int i = 0; i < imgDtos.size(); i++) {
					String fileName=imgDtos.get(i).getFilename();
					File file = new File(filePath, fileName);
					file.delete();
				}
			}
		dao.lost_item_delete_img(total_id);
		dao.lost_item_delete_content(total_id);
	}
	
	@Override
	public void lost_item_modify_page(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		String total_id = request.getParameter("total_id");
		
		ItemDao dao = sqlSession.getMapper(ItemDao.class);
		ItemDto dto = dao.lost_item_detail_page(total_id);
		ArrayList<ItemImgDto> imgDtos=dao.lost_item_detail_img(total_id);
		
		String userTel=dto.getUser_tel();
		String[]userTels=userTel.split("-");
		
		model.addAttribute("userTels", userTels);
		model.addAttribute("dto", dto);
		model.addAttribute("imgDtos", imgDtos);
	}
}
