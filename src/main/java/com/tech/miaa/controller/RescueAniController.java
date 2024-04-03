package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;

import com.tech.miaa.abdmApi.*;
import com.tech.miaa.dto.AnimalSearchDto;
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

    @RequestMapping(value = "/rescue_ani_search_page", method = RequestMethod.GET)
    public String rescue_ani_search_page(HttpServletRequest request, Model model) {
        AbdmPublic abdmPublic = AbandonmentPublicSrvc.abandonmentPublic();
        itemList = abdmPublic.getItems();
        String totalCount = abdmPublic.getTotalCount();
        model.addAttribute("itemList", itemList);
        model.addAttribute("totalCount", totalCount);
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
        int a = 1;
        System.out.println(Integer.toString(a));
        AbandonmentPublicSrvc.abandonmentPublic(dto,1);
        return "";
    }
}
