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

    private PageVO pageVO = new PageVO();
    @RequestMapping(value = "/rescue_ani_search_page")
    public String rescue_ani_search_page(HttpServletRequest request, Model model, AnimalSearchDto dto) {

        current_dto = dto;


        if (isFirst) {
            current_dto.setPageVO(pageVO);
            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(current_dto.getPageVO().getPage());
            isFirst = false;
        } else {
            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(current_dto, current_dto.getPageVO().getPage());
        }
        int totalCount = 0;
        itemList = abdmPublic.getItems();
        if (abdmPublic.getTotalCount() != null)
            totalCount = Integer.parseInt(abdmPublic.getTotalCount());


        current_dto.getPageVO().pageCalculate(totalCount);

        System.out.println("getPage : "+current_dto.getPageVO().getPage() );
        System.out.println("getPageStart"+current_dto.getPageVO().getPageStart() );
        System.out.println("getPageEnd"+current_dto.getPageVO().getPageEnd() );
        System.out.println("totRow : "+current_dto.getPageVO().getTotRow());
        SexEnum[] sexEnum = SexEnum.values();
        SigunguEnum[] sigunguEnums = SigunguEnum.values();

        model.addAttribute("itemList", itemList);
        model.addAttribute("dto", current_dto);
        model.addAttribute("sexEnum", sexEnum);
        model.addAttribute("sigunguEnums", sigunguEnums);

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
