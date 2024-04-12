
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

import com.tech.miaa.dao.LostItemDao;
import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.dto.ItemImgDto;
import com.tech.miaa.serviceInter.LostItemServiceInter;
import com.tech.miaa.util.PrdCode;
import com.tech.miaa.vopage.PageVO;

public class LostItemService implements LostItemServiceInter {
	
	private String filePath="C:\\23setspring\\springwork23\\MIAA\\src\\main\\webapp";
	
	@Override
	public ArrayList<ItemDto> lost_item_search(Model model) {
		Map<String, Object> map = model.asMap();
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		LostItemDao dao = sqlSession.getMapper(LostItemDao.class);
		
		//검색 입력값 가져오기
		String searchday1 = request.getParameter("searchday1");
		String searchday2 = request.getParameter("searchday2");
		String addressCode = request.getParameter("addressCode");
		String itemkind1 = request.getParameter("itemkind1");
		String itemkind2 = request.getParameter("itemkind2");
		String colorCd = request.getParameter("colorCd");
		
		System.out.println(searchday1+"~"+searchday2);
		System.out.println(addressCode);
		System.out.println(itemkind1+"-"+itemkind2);
		System.out.println(colorCd);
		
		
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
		
		
		
		
		//사진이 없을 때 기본이미지로 대체
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
				}else if(itemList.get(i).getUpkind().equals("PRC000")) {
					itemList.get(i).setFilename("resources/item_default/서류.png");
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
		//DB코드로 된 값 이름으로 대체
		PrdCode pc = new PrdCode();
		for (int i = 0; i < itemList.size(); i++) {
			itemList.get(i).setUpkind(pc.getPrdNameByCode(itemList.get(i).getUpkind()));
			itemList.get(i).setUpr_cd(pc.getPrdNameByCode(itemList.get(i).getUpr_cd()));
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageVo", pageVo);
		return itemList;
	}
	
	@Override
	public String lost_item_write(Model model){
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		
		String result=""; LostItemDao dao = sqlSession.getMapper(LostItemDao.class);
		
		String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String openclose=request.getParameter("openclose"); String lostday=request.getParameter("lostday");
		String address=request.getParameter("address"); String itemname=request.getParameter("itemname");
		String itemkind1=request.getParameter("itemkind1"); String itemkind2=request.getParameter("itemkind2");
		String colorCd=request.getParameter("colorCd"); String sepcialMark=request.getParameter("sepcialMark");
		String userId=request.getParameter("userId"); String addressCode=request.getParameter("addressCode");
		
		if(lostday.equals("")|| address.equals("")|| itemname.equals("") || itemkind1.equals("분류를 선택하세요") || colorCd.equals("색상을 선택하세요")
				|| addressCode.equals("지역을 선택하세요")) {
			System.out.println("필수 입력란을 모두 기입하세요.");
			result="redirect:lost_item_write_page";
		}else {
			dao.itemWrite(tel, openclose, lostday, address, itemname, itemkind1, itemkind2, colorCd, sepcialMark, userId,addressCode);
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
	public ItemDto lost_item_detail_page(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		
		String total_id = request.getParameter("total_id");
		
		LostItemDao dao = sqlSession.getMapper(LostItemDao.class);
		ItemDto dto = null; ArrayList<ItemImgDto> imgDtos=null;
		try {
			dto=dao.lost_item_detail_page(total_id);
			imgDtos=dao.lost_item_detail_img(total_id);
			//사진이 없을 때 기본아이콘 대체
			if (imgDtos.size()==0) {
				if(dto.getUpkind().equals("PRI000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/노트북.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRJ000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/휴대폰.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRH000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/지갑.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRG000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/전자기기.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRD000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/산업.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRO000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/보석.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRZ000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/기타물품.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRC000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/서류.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRE000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/스포츠.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRF000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/자동차.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRL000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/현금.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRK000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/의류.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRQ000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/쇼핑백.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRR000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/악기.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRP000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/카드.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRM000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0, null, "resources/item_default/증권.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRN000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0,null, "resources/item_default/증명서.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRA000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0,null, "resources/item_default/가방.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRB000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0,null, "resources/item_default/책.png"); imgDtos.add(0, imgdto);
				}else if(dto.getUpkind().equals("PRX000")) {
					ItemImgDto imgdto = new ItemImgDto(0,0,null, "resources/item_default/유류물품.png"); imgDtos.add(0, imgdto);
				}
			}
		} catch (Exception e) {}
		PrdCode pc = new PrdCode();
		dto.setUpkind(pc.getPrdNameByCode(dto.getUpkind()));
		dto.setUpr_cd(pc.getPrdNameByCode(dto.getUpr_cd()));
		
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
		
		LostItemDao dao = sqlSession.getMapper(LostItemDao.class);
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
		
		LostItemDao dao = sqlSession.getMapper(LostItemDao.class);
		ItemDto dto = dao.lost_item_detail_page(total_id);
		ArrayList<ItemImgDto> imgDtos=dao.lost_item_detail_img(total_id);
		PrdCode pc = new PrdCode();
		
		ArrayList<String> kind = new ArrayList<>();
		kind.add(0, pc.getPrdNameByCode(dto.getUpkind()));
		kind.add(1, pc.getPrdNameByCode(dto.getUpr_cd()));
		kind.add(2, pc.getPrdNameByCode(dto.getColorcd()));
		kind.add(3, pc.getPrdNameByCode(dto.getAddressCode()));
		
		String userTel=dto.getUser_tel();
		String[]userTels=userTel.split("-");
		
		model.addAttribute("kind", kind);
		model.addAttribute("userTels", userTels);
		model.addAttribute("dto", dto);
		model.addAttribute("imgDtos", imgDtos);
	}
	
	@Override
	public String lost_item_modify(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SqlSession sqlSession = (SqlSession) map.get("sqlSession");
		ArrayList<MultipartFile> files = (ArrayList<MultipartFile>) map.get("files");
		String result=null; LostItemDao dao = sqlSession.getMapper(LostItemDao.class);
		
		String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String openclose=request.getParameter("openclose");
		String lostday=request.getParameter("lostday");
		String address=request.getParameter("address");
		String itemname=request.getParameter("itemname");
		String upkind=request.getParameter("itemkind1");
		String upr_cd=request.getParameter("itemkind2");
		String colorCd = request.getParameter("colorCd");
		String sepcialMark = request.getParameter("sepcialMark");
		String total_id = request.getParameter("total_id");
		String user_id = request.getParameter("user_id");
		String addressCode=request.getParameter("addressCode");
		//기존 업로드 사진 삭제
		ArrayList<ItemImgDto> imgDtos=dao.lost_item_detail_img(total_id);
		if(imgDtos.size()!=0) {
			for (int i = 0; i < imgDtos.size(); i++) {
				String fileName=imgDtos.get(i).getFilename();
				File file = new File(filePath, fileName);
				file.delete();
			}
		}
		dao.lost_item_delete_img(total_id);
		//수정
		if(lostday.equals("")|| address.equals("")|| itemname.equals("") || upkind.equals("중분류") || colorCd.equals("색상을 선택하세요")) {
			System.out.println("필수 입력란을 모두 기입하세요.");
			result="redirect:lost_item_modify_page?total_id="+total_id;
		}else {
			dao.lost_item_modify(tel,openclose,lostday,address,itemname,upkind,upr_cd,colorCd,sepcialMark,addressCode,total_id);
			for (int i = 0; i < files.size(); i++) {
				if(files.get(i).getOriginalFilename()=="") {
					continue;
				}else if(files.get(i).getOriginalFilename()!=""){
					try {
						UUID uuid=UUID.randomUUID();
						String fileName="resources/item_img/"+uuid+"_"+files.get(i).getOriginalFilename();
						File saveFile = new File(filePath, fileName);
						files.get(i).transferTo(saveFile);
						dao.imgUpLoad(user_id,(i+1),itemname,fileName);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			System.out.println("수정되었습니다.");
			result="redirect:lost_item_search_page";
		}
		return result;
	}
}
