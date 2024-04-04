package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;

import com.tech.miaa.abdmApi.*;
import com.tech.miaa.dto.AnimalSearchDto;
import com.tech.miaa.vopage.PageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.tech.miaa.service.AnimalService;
import com.tech.miaa.serviceInter.AnimalServiceInter;

import java.util.List;
import java.util.Optional;

@Controller
public class RescueAniController {
    @Autowired
    private SqlSession sqlSession;
    private List<AbdmPublicItem> itemList;
    private AbdmPublic abdmPublic;
    private Boolean isFirst = true;
    private AnimalSearchDto current_dto;
    @RequestMapping(value = "/rescue_ani_search_page")
    public String rescue_ani_search_page(HttpServletRequest request, Model model,AnimalSearchDto dto) {
        String strPage = request.getParameter("page");
        if (strPage == null){
            strPage = "1";
        }
        int page = Integer.parseInt(strPage);
//        System.out.println("strPage"+strPage);
//
        current_dto = dto;
        System.out.println("dto : "+current_dto);
        System.out.println("getSearch_str_date : "+current_dto.getSearch_str_date());
        System.out.println("getSearch_end_date : "+current_dto.getSearch_end_date());
        System.out.println("getSidoSelectBox : "+current_dto.getSidoSelectBox());
        System.out.println("getSigunguSelectBox : "+current_dto.getSigunguSelectBox());
        System.out.println("getShelterSelectBox : "+current_dto.getShelterSelectBox());
        System.out.println("getUpKindSelectBox : "+current_dto.getUpKindSelectBox());
        System.out.println("getKindSelectedBox : "+current_dto.getKindSelectedBox());
        System.out.println("getSexSelectedBox : "+current_dto.getSexSelectedBox());

        PageVO pageVO = new PageVO();
        pageVO.setPage(page);
        System.out.println("page :"+ page);
        if (isFirst){
            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(strPage);
            System.out.println("isFirst");
            isFirst = false;
        }else {
            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(current_dto,page);
            System.out.println("isNotFirst");
        }
        itemList = abdmPublic.getItems();
        int totalCount = Integer.parseInt(abdmPublic.getTotalCount());

        System.out.println("totalCount"+totalCount);
        pageVO.pageCalculate(totalCount);
        model.addAttribute("itemList", itemList);
        model.addAttribute("dto", current_dto);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("pageVO",pageVO);
        return "rescue_ani.search_page.보호동물 검색.3";
    }

    //JeongMin
    @RequestMapping(value = "/rescue_ani_detail_page", method = RequestMethod.GET)
    public String rescue_ani_detail_page(HttpServletRequest request, Model model) {
        String ab = request.getParameter("noticeNo");
        Optional<AbdmPublicItem> result= itemList.stream().filter(x -> x.getNoticeNo().equals(ab)).findAny();
        AbdmPublicItem item = result.get();
        model.addAttribute("item", item);
        return "rescue_ani.detail_page.보호동물 상세페이지.2";
    }

    @PostMapping("/rescue_ani_search")
    public String rescue_ani_search(HttpServletRequest request, Model model, AnimalSearchDto dto){
        System.out.println(dto.getSearch_str_date());
        System.out.println(dto.getSearch_end_date());
        System.out.println(dto.getSidoSelectBox());
        System.out.println(dto.getSigunguSelectBox());
        System.out.println(dto.getShelterSelectBox());
        System.out.println(dto.getUpKindSelectBox());
        System.out.println(dto.getKindSelectedBox());
        System.out.println(dto.getSexSelectedBox());
        AbdmPublic abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(dto,1);
        itemList = abdmPublic.getItems();
        int totalCount = Integer.parseInt(abdmPublic.getTotalCount());
        model.addAttribute("itemList", itemList);
        model.addAttribute("totalCount", totalCount);
        return "rescue_ani.search_page.보호동물 검색.3";
    }
}
