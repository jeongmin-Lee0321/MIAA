package com.tech.miaa.controller;

import javax.servlet.http.HttpServletRequest;

import com.tech.miaa.abdmApi.*;
import com.tech.miaa.dto.AnimalDetailDto;
import com.tech.miaa.dto.AnimalSearchDto;
import com.tech.miaa.vopage.PageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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
    private ArrayList<AbdmKindItem> abdmKindItems = new ArrayList<>();

    private  PageVO current_pageVO;
    @RequestMapping(value = "/rescue_ani_search_page")
    public String rescue_ani_search_page(HttpServletRequest request, Model model, AnimalSearchDto dto,PageVO page_VO) {
        if (dto.getSearch_str_date() != null || dto.getSearch_end_date() != null ||
        dto.getSidoSelectBox() != null || dto.getSigunguSelectBox() != null ||
        dto.getUpKindSelectBox() != null || dto.getKindSelectedBox() != null ||
        dto.getSexSelectedBox() != null){
            current_dto = dto;
        }
        String strPage = request.getParameter("page");
        if (strPage == null) {
            strPage = "1";
        }
        int page = Integer.parseInt(strPage);
        //페이지 초과문제 해결
        if (current_pageVO != null &&current_pageVO.getTotPage() < page)
            page = current_pageVO.getTotPage();
        page_VO.setPage(page);
        if (isFirst) {
            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(page_VO.getPage());
            isFirst = false;
        } else {
            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(current_dto, page_VO.getPage());
        }
        int totalCount = 0;
        itemList = abdmPublic.getItems();
        if (abdmPublic.getTotalCount() != null) {
            totalCount = Integer.parseInt(abdmPublic.getTotalCount());
        }
        page_VO.pageCalculate(totalCount);

        SexEnum[] sexEnum = SexEnum.values();
        current_pageVO = page_VO;
        model.addAttribute("itemList", itemList);
        model.addAttribute("dto", current_dto);
        model.addAttribute("sexEnum", sexEnum);
        model.addAttribute("abdmKindItems", abdmKindItems);
        model.addAttribute("pageVO",page_VO);
        return "rescue_ani.search_page.보호동물 검색.3";
    }

    //JeongMin
    @RequestMapping(value = "/rescue_ani_detail_page", method = RequestMethod.GET)
    public String rescue_ani_detail_page(HttpServletRequest request, Model model) {
        String ab = request.getParameter("noticeNo");
        Optional<AbdmPublicItem> result = itemList.stream().filter(x -> x.getNoticeNo().equals(ab)).findAny();
        AbdmPublicItem item = result.get();
        System.out.println(item.getKindCd());
        AnimalDetailDto dto = new AnimalDetailDto(item);
        model.addAttribute("dto", dto);
        return "rescue_ani.detail_page.보호동물 상세페이지.2";
    }
}
