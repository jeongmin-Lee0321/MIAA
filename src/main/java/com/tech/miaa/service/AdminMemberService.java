package com.tech.miaa.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.tech.miaa.dao.AdminInquiryDao;
import com.tech.miaa.dto.*;
import com.tech.miaa.vopage.PageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.miaa.dao.AdminMemberDao;
import com.tech.miaa.dao.MemberDao;
import com.tech.miaa.serviceInter.AdminMemberServiceInter;
import com.tech.miaa.util.CryptoUtil;

public class AdminMemberService implements AdminMemberServiceInter {

    @Override
    public int admin_idchek(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        SqlSession sqlSession = (SqlSession) map.get("sqlSession");

        String id = request.getParameter("id");
        int num = 0;
        if (id == "") {
            num = -1;
        } else {
            AdminMemberDao dao = sqlSession.getMapper(AdminMemberDao.class);
            num = dao.admin_idcheck(id);
        }
        return num;
    }

    @Override
    public int admin_emailchk(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        SqlSession sqlSession = (SqlSession) map.get("sqlSession");

        String email = request.getParameter("email");
        int num = 0;

        if (email == "") {
            num = -1;
        } else {
            AdminMemberDao dao = sqlSession.getMapper(AdminMemberDao.class);
            num = dao.admin_emailcheck(email);
        }

        return num;
    }

    //	admin_codeck 관리자가입 코드 Aldkxptmxm
    @Override
    public int admin_codechk(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        SqlSession sqlSession = (SqlSession) map.get("sqlSession");
        //인증코드
        String code = request.getParameter("code");
        int num = 0;

        if (code == "") {
            num = -1; //값없을 경우 -1
        } else if (code.equals("Aldkxptmxm")) {
            num = 0; // 맞을경우 0
        } else {
            num = 1; // 틀릴경우 -1
        }

        return num;
    }

    @Override
    public String admin_join(Model model) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        SqlSession sqlSession = (SqlSession) map.get("sqlSession");

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String pw2 = request.getParameter("pw2");
        String shpwd = "";
        String bcpwd = "";
        String email = request.getParameter("email");
//		인증코드
        String code = request.getParameter("code");

        String result = "redirect:admin";

        // 암호화 처리
        try {
            shpwd = CryptoUtil.sha512(pw);
            bcpwd = CryptoUtil.encryptAES256(pw, shpwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(bcpwd);
        AdminMemberDao dao = sqlSession.getMapper(AdminMemberDao.class);
        int idcheck = dao.admin_idcheck(id);
        int emailcheck = dao.admin_emailcheck(email);
        //인증코드체크
        int codecheck = admin_codechk(model);

        switch (codecheck) {
            case 0:
                if (id != "" && email != "" && pw != "") {
                    // 가입가능여부 확인 (아이디, 이메일 중복확인)
                    if (idcheck >= 1 && emailcheck >= 1) {
                        System.out.println("아이디와 이메일이 중복됩니다.");
                    } else if (idcheck == 0 && emailcheck >= 1) {
                        System.out.println("이메일이 중복됩니다.");
                    } else if (idcheck >= 1 && emailcheck == 0) {
                        System.out.println("아이디가 중복됩니다.");
                    } else {
                        // 가입가능여부 확인 (비밀번호와 비밀번호 확인 같은지 확인)
                        if (pw.equals(pw2)) {
                            System.out.println("관리자 가입 완료.");
                            dao.admin_join(id, shpwd, bcpwd, email);
                            result = "redirect:loginform";
                        } else {
                            System.out.println("비밀번호를 확인해주세요.");
                        }
                    }
                }
                break;
            case -1:
                System.out.println("인증코드가 틀렸습니다");
            default:
                System.out.println("인증코드를 확인해주세요");
                break;
        }

        return result;
    }

    @Override
    public void member_list(Model model, PageVO pageVo) {
        Map<String, Object> map = model.asMap();
        SqlSession sqlSession = (SqlSession) map.get("sqlSession");
        AdminMemberSearchDto dto = (AdminMemberSearchDto) map.get("dto");

//        pageVo = get_pagevo(model, pageVo);
        set_search_dto(model, pageVo);
        MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
        AdminMemberDao adminMemberDao = sqlSession.getMapper(AdminMemberDao.class);

        ArrayList<MemberDto> memberDtos = memberDao.getMembers();
        ArrayList<AdminMemberDto> adminMemberDtos = adminMemberDao.getAdminMembers();
        ArrayList<MemberDto> totalDto = new ArrayList<>(memberDtos);

        for (AdminMemberDto d : adminMemberDtos) {
            MemberDto tmp = new MemberDto();
            tmp.setUser_id(d.getUser_id());
            tmp.setUser_email(d.getUser_email());
            tmp.setUser_grade("관리자");
            totalDto.add(tmp);
        }

        if (dto.getJOIN_START_YMD() != null && dto.getJOIN_END_YMD() != null && dto.getSTART_YMD() != null && dto.getEND_YMD() != null && dto.getMember_grade() != null && dto.getSearch_type() != null && dto.getSearch_content() != null) {
            List<MemberDto> tmp = new ArrayList<>();
            List<MemberDto> membertmp = totalDto.stream().filter(x -> x.getUser_grade().equals("일반회원")).collect(Collectors.toList());
            List<MemberDto> admintmp = totalDto.stream().filter(x -> x.getUser_grade().equals("관리자")).collect(Collectors.toList());


            if (!dto.getSearch_content().isEmpty()) {
                membertmp = membertmp.stream().filter(x -> x.getUser_id().equals(dto.getSearch_content())).collect(Collectors.toList());
                admintmp = admintmp.stream().filter(x -> x.getUser_id().equals(dto.getSearch_content())).collect(Collectors.toList());
            }

            if (!dto.getJOIN_START_YMD().isEmpty() && !dto.getJOIN_END_YMD().isEmpty()) {
                membertmp = membertmp.stream().filter(x -> Integer.parseInt(x.getUser_join_date().substring(0, x.getUser_join_date().indexOf(" ")).replace("-", "")) >= Integer.parseInt(dto.getJOIN_START_YMD().replace("-", "")) && Integer.parseInt(x.getUser_join_date().substring(0, x.getUser_join_date().indexOf(" ")).replace("-", "")) <= Integer.parseInt(dto.getJOIN_END_YMD().replace("-", ""))).collect(Collectors.toList());
            }

            if (!dto.getSTART_YMD().isEmpty() && !dto.getEND_YMD().isEmpty()) {
                membertmp = membertmp.stream().filter(x -> Integer.parseInt(x.getUser_last_login().substring(0, x.getUser_last_login().indexOf(" ")).replace("-", "")) >= Integer.parseInt(dto.getSTART_YMD().replace("-", "")) && Integer.parseInt(x.getUser_last_login().substring(0, x.getUser_last_login().indexOf(" ")).replace("-", "")) <= Integer.parseInt(dto.getEND_YMD().replace("-", ""))).collect(Collectors.toList());
            }

            if (!dto.getMember_grade().isEmpty()) {
                if (dto.getMember_grade().equals("일반회원")) tmp.addAll(membertmp);
                else if (dto.getMember_grade().equals("관리자")) tmp.addAll(admintmp);
                else {
                    tmp.addAll(admintmp);
                    tmp.addAll(membertmp);
                }
            }

            totalDto.clear();
            totalDto.addAll(tmp);
        }
        pageVo = get_pagevo(totalDto, model, pageVo);
        List<MemberDto> displayDto = new ArrayList<>();
        System.out.println("totalDto.size()"+totalDto.size());
        System.out.println("totalDto.size()"+pageVo.getPage());
        System.out.println("totalDto.size()"+totalDto.size());
        System.out.println("totalDto.size()"+totalDto.size());
        if (totalDto.size()< pageVo.getPage()*pageVo.getDisplayRowCount()){
            displayDto = totalDto.subList((pageVo.getPage()-1)*pageVo.getDisplayRowCount(), totalDto.size());
        }else {
            displayDto = totalDto.subList((pageVo.getPage()-1)*pageVo.getDisplayRowCount(),pageVo.getPage()*pageVo.getDisplayRowCount()-1);
        }
        dto.setRowEnd(pageVo.getRowEnd());
        dto.setRowStart(pageVo.getRowStart());

        model.addAttribute("search", dto);
        model.addAttribute("list", displayDto);
    }

    public PageVO get_pagevo(ArrayList<MemberDto> dto,Model model, PageVO pageVo) {
        int page = 0; // 현재 페이지
        int total = 0; // 모든 게시물 갯수
        int displayRowCount = 6; // 보여질 페이지 갯수

        Map<String, Object> map = model.asMap();
        SqlSession sqlSession = (SqlSession) map.get("sqlSession");
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        String currPage = request.getParameter("currPage");

        // 토탈페이지 먼저 구하기
//        MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
//        AdminMemberDao adminMemberDao = sqlSession.getMapper(AdminMemberDao.class);

        try {
            total = dto.size();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("전체 목록개수" + total);
        // 현재페이지 경우의수
        if (currPage == null) { // strPage 가 뷰에서 전달되지 않은경우(첫화면)
            currPage = "1";
            page = Integer.parseInt(currPage);
        } else { // strPage값이 뷰에서 현재로 전달된경우
            page = Integer.parseInt(currPage);
            if (page > total / displayRowCount) {// 현재페이지 값이 총 페이지 갯수보다 클경우 시작페이지= 총페이지 갯수
                page = total / displayRowCount + (total % displayRowCount == 0 ? 0 : 1);
            } else if (page <= 0) {// 시작페이지 값이 음수일경우 page =1
                page = 1;
            }
        }

        pageVo.setDisplayRowCount(displayRowCount);// 보여질 페이지 갯수 적용
        pageVo.setPage(page);// 시작페이지 적용

        pageVo.pageCalculate(total);

        System.out.println("전달받은 현재페이지" + currPage);
        return pageVo;
    }

    public void set_search_dto(Model model, PageVO pageVo) {
        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        AdminMemberSearchDto dto = (AdminMemberSearchDto) map.get("dto");
        // 만들어진 PageVo로 글목록의 star와 end를 가져옴
//        int rowStart = pageVo.getRowStart();
//        int rowEnd = pageVo.getRowEnd();
//        dto.setRowEnd(rowEnd);
//        dto.setRowStart(rowStart);

        //param-> null 이면 최초 화면

        //param -> null이 아니면 검색조건 추가한 창
        String JOIN_START_YMD = request.getParameter("JOIN_START_YMD");
        String JOIN_END_YMD = request.getParameter("JOIN_END_YMD");
        String START_YMD = request.getParameter("START_YMD");
        String END_YMD = request.getParameter("END_YMD");
        String member_grade = request.getParameter("member_grade");
        String search_type = request.getParameter("search_type");
        String search_content = request.getParameter("search_content");

        dto.setJOIN_START_YMD(JOIN_START_YMD);
        dto.setJOIN_END_YMD(JOIN_END_YMD);
        dto.setSTART_YMD(START_YMD);
        dto.setEND_YMD(END_YMD);
        dto.setMember_grade(member_grade);
        dto.setSearch_type(search_type);
        dto.setSearch_content(search_content);

    }
}
