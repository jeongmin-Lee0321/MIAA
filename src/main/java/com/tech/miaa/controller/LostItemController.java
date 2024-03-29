<<<<<<< HEAD
<<<<<<<< HEAD:src/main/java/com/tech/miaa/controller/LostItemController.java
=======
>>>>>>> c4b2b53391cf954636b642ba24bbb1dbe4036ea9
package com.tech.miaa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.service.ItemService;
=======
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.service.AnimalService;
import com.tech.miaa.service.ItemService;
import com.tech.miaa.serviceInter.AnimalServiceInter;
>>>>>>> c4b2b53391cf954636b642ba24bbb1dbe4036ea9
import com.tech.miaa.serviceInter.ItemServiceInter;

@Controller
public class LostItemController {
	@Autowired
	private SqlSession sqlSession;
	
	ItemServiceInter itemService;
	
<<<<<<< HEAD
	@RequestMapping("lost_item_search")
	public String itemlistview(HttpServletRequest request, Model model){
		model.addAttribute("sqlSession", sqlSession);
		
		itemService = new ItemService();
		ArrayList<ItemDto> itemList=itemService.lost_item_search(model);
		
		model.addAttribute("itemList", itemList);
		return "lost_item.search_page.습득물 검색 페이지.1";
	}
	
	@RequestMapping("lost_item_write_view")
	public String lost_item_write_view(Model model, @SessionAttribute(name = "userId", required = false) String userId){
		String result = "";
			if(userId!=null) {
				result = "lost_item.write_page.분실물 등록 페이지.2";
			}else if(userId==null) {
				System.out.println("로그인 해야만 작성이 가능합니다.");
				result = "redirect:loginform";
=======
	@RequestMapping(value = "/lost_item_search_page", method = RequestMethod.GET)
	public String rescue_ani_search_page(HttpServletRequest request, Model model ) {
		model.addAttribute("sqlSession", sqlSession);
		
		/*
		 itemService = new ItemService(); ArrayList<ItemDto>
		 itemList=itemService.lost_item_search(model);
		 
		 model.addAttribute("itemList", itemList);
		 */
		return "lost_item.search_page.분실물 상세검색.3";
	}

	
	@RequestMapping("lost_item_write_page")
	public String lost_item_write_view(Model model, @SessionAttribute(name = "userId", required = false) String userId){
		String result = "";
			if(userId!=null) {
				result = "lost_item.write_page.분실물등록.2";
			}else if(userId==null) {
				System.out.println("로그인 해야만 작성이 가능합니다.");
				result = "login.loginform_page.로그인페이지.1";
>>>>>>> c4b2b53391cf954636b642ba24bbb1dbe4036ea9
			}
		return result;
	}
	@RequestMapping("lost_item_write")
<<<<<<< HEAD
	public String lost_item_write(HttpServletRequest request, Model model, MultipartHttpServletRequest multi){
		model.addAttribute("request", request); model.addAttribute("sqlSession", sqlSession);
		model.addAttribute("multi", multi);
=======
	public String lost_item_write(HttpServletRequest request, Model model){
		model.addAttribute("request", request); model.addAttribute("sqlSession", sqlSession);
		
>>>>>>> c4b2b53391cf954636b642ba24bbb1dbe4036ea9
		itemService=new ItemService();
		String result=itemService.lost_item_write(model);
		
		return result;
	}
}
<<<<<<< HEAD
========
/*
 * package com.tech.miaa.controller;
 * 
 * import java.util.ArrayList;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.apache.ibatis.session.SqlSession; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.SessionAttribute;
 * 
 * import com.tech.miaa.dto.ItemDto; import com.tech.miaa.service.ItemService;
 * import com.tech.miaa.serviceInter.ItemServiceInter;
 * 
 * @Controller public class ItemController {
 * 
 * @Autowired private SqlSession sqlSession;
 * 
 * ItemServiceInter itemService;
 * 
 * @RequestMapping("lost_item_search") public String
 * itemlistview(HttpServletRequest request, Model model){
 * model.addAttribute("sqlSession", sqlSession);
 * 
 * itemService = new ItemService(); ArrayList<ItemDto>
 * itemList=itemService.lost_item_search(model);
 * 
 * model.addAttribute("itemList", itemList); return
 * "item/lost_item_search_page"; }
 * 
 * @RequestMapping("write_view") public String lost_item_write_view(Model
 * model, @SessionAttribute(name = "userId", required = false) String userId){
 * String result = ""; if(userId!=null) { result =
 * "lost_item/lost_item_write_page"; }else if(userId==null) {
 * System.out.println("로그인 해야만 작성이 가능합니다."); result = "login/loginform_page"; }
 * return result; }
 * 
 * @RequestMapping("lost_item_write") public String
 * lost_item_write(HttpServletRequest request, Model model){
 * model.addAttribute("request", request); model.addAttribute("sqlSession",
 * sqlSession);
 * 
 * itemService=new ItemService(); String
 * result=itemService.lost_item_write(model);
 * 
 * return result; } }
 */
>>>>>>>> c4b2b53391cf954636b642ba24bbb1dbe4036ea9:src/main/java/com/tech/miaa/controller/ItemController.java
=======
>>>>>>> c4b2b53391cf954636b642ba24bbb1dbe4036ea9
