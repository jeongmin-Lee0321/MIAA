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

import com.tech.miaa.service.AnimalService;
import com.tech.miaa.serviceInter.AnimalServiceInter;

import java.util.Arrays;
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

    //    private PageVO pageVO = new PageVO();
    @RequestMapping(value = "/rescue_ani_search_page")
    public String rescue_ani_search_page(HttpServletRequest request, Model model, AnimalSearchDto dto) {

        current_dto = dto;
        if (current_dto.getPageNo() == null || current_dto.getPageNo().isEmpty()) {
            current_dto.setPageNo("1");
        }
        if (current_dto.getPageVO() == null) {
            current_dto.setPageVO(new PageVO());
            System.out.println("ADSfasdfas" + current_dto.getPageNo());
            System.out.println("ADSfasdfas ga" + current_dto.getPageVO().getPage());
//            current_dto.getPageVO().setPage(Integer.parseInt(current_dto.getPageNo()));
        }
//        System.out.println("dto : " + current_dto);
//        System.out.println("getSearch_str_date : " + current_dto.getSearch_str_date());
//        System.out.println("getSearch_end_date : " + current_dto.getSearch_end_date());
//        System.out.println("getSidoSelectBox : " + current_dto.getSidoSelectBox());
//        System.out.println("getSigunguSelectBox : " + current_dto.getSigunguSelectBox());
//        System.out.println("getShelterSelectBox : " + current_dto.getShelterSelectBox());
//        System.out.println("getUpKindSelectBox : " + current_dto.getUpKindSelectBox());
//        System.out.println("getKindSelectedBox : " + current_dto.getKindSelectedBox());
//        System.out.println("getSexSelectedBox : " + current_dto.getSexSelectedBox());
//        System.out.println("dsafasdf :" + request.getParameter("sido_selected_code"));

        if (isFirst) {
            System.out.println("isFirst pageNo : " + current_dto.getPageNo());
            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(current_dto.getPageNo());
            isFirst = false;
        } else {
            System.out.println("else isFirst pageNo : " + current_dto.getPageNo());
            System.out.println("test"+Float.parseFloat(current_dto.getPageNo()));
            System.out.println("test int"+ (int)Float.parseFloat(current_dto.getPageNo()));
//            (int)Float.parseFloat(current_dto.getPageNo());

//            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(current_dto, page);
            if (current_dto.getPageShift() != null) {
                System.out.println(Integer.parseInt(current_dto.getPageNo()));
                System.out.println(Integer.parseInt(current_dto.getPageShift()));
                System.out.println(Integer.parseInt(current_dto.getPageNo()) + Integer.parseInt(current_dto.getPageShift()));
                System.out.println(Integer.toString(Integer.parseInt(current_dto.getPageNo()) + Integer.parseInt(current_dto.getPageShift())));
                current_dto.setPageNo(Integer.toString((int)Float.parseFloat(current_dto.getPageNo())));
            }
            current_dto.getPageVO().setPage(Integer.parseInt(current_dto.getPageNo()));
            System.out.println("pageVo.getpage : " + current_dto.getPageVO().getPage());
            abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(current_dto, current_dto.getPageVO().getPage());
            System.out.println("isNotFirst");
        }
        int totalCount = 0;
        itemList = abdmPublic.getItems();
        if (abdmPublic.getTotalCount() != null)
            totalCount = Integer.parseInt(abdmPublic.getTotalCount());

        System.out.println("totalCount" + totalCount);
//        pageVO.pageCalculate(totalCount);
        //
        current_dto.getPageVO().pageCalculate(totalCount);
        SexEnum[] sexEnum = SexEnum.values();
        SigunguEnum[] sigunguEnums = SigunguEnum.values();

        model.addAttribute("itemList", itemList);
        model.addAttribute("dto", current_dto);
        model.addAttribute("totalCount", totalCount);
//        model.addAttribute("pageVO", pageVO);
        model.addAttribute("sexEnum", sexEnum);
        model.addAttribute("sigunguEnums", sigunguEnums);
        System.out.println("isFirst pageNo22 : " + current_dto.getPageNo());

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

    @PostMapping("/rescue_ani_search")
    public String rescue_ani_search(HttpServletRequest request, Model model, AnimalSearchDto dto) {
        System.out.println(dto.getSearch_str_date());
        System.out.println(dto.getSearch_end_date());
        System.out.println(dto.getSidoSelectBox());
        System.out.println(dto.getSigunguSelectBox());
        System.out.println(dto.getShelterSelectBox());
        System.out.println(dto.getUpKindSelectBox());
        System.out.println(dto.getKindSelectedBox());
        System.out.println(dto.getSexSelectedBox());
        AbdmPublic abdmPublic = AbandonmentPublicSrvc.abandonmentPublic(dto, 1);
        itemList = abdmPublic.getItems();
        int totalCount = Integer.parseInt(abdmPublic.getTotalCount());
        model.addAttribute("itemList", itemList);
        model.addAttribute("totalCount", totalCount);
        return "rescue_ani.search_page.보호동물 검색.3";
    }
}
