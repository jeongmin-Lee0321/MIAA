package com.tech.miaa.scheduler;

import com.tech.miaa.dao.LostItemDao;
import com.tech.miaa.dao.MatchingAlarmDao;
import com.tech.miaa.dao.MemberDao;
import com.tech.miaa.dto.FounditemDto;
import com.tech.miaa.dto.ItemDto;
import com.tech.miaa.dto.MemberDto;
import com.tech.miaa.service.FounditemService;
import com.tech.miaa.vopage.PageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Component
public class Scheduler {


    @Autowired
    private SqlSession sqlSession;

    // sec/min/hour/day/month/day of week/year
    // 0-59/0-59/0~23/1-31/1-12/0-6/생략가능
    @Scheduled(cron = "0/20 * * * * *")
    public void updateAnimalAlertList() {
        System.out.println("테스트 : " + new Date());
        MemberDao dao = sqlSession.getMapper(MemberDao.class);
        List<MemberDto> memberDtoList = dao.getMembers();
        for (int i =0; i<memberDtoList.size(); i++){
            String memeberId = memberDtoList.get(i).getUser_id();
            System.out.println(memeberId);

//            //분실물
            LostItemDao lostItemDao = sqlSession.getMapper(LostItemDao.class);
            List<ItemDto> itemDtos =lostItemDao.get_lost_items(memeberId);
            for (int j = 0; j <itemDtos.size(); j++){
                //api 호출
                FounditemService founditemService = new FounditemService();
                String a = founditemService.found_item_search_AreaPd(itemDtos.get(i));
                System.out.println(a);
                ArrayList<FounditemDto> founditemDtos = founditemService.getFoundList(a);

                //db 저장
                MatchingAlarmDao matchingAlarmDao = sqlSession.getMapper(MatchingAlarmDao.class);
                for (int t = 0; t<founditemDtos.size(); t++){
//                    System.out.println(memeberId);
//                    System.out.println(founditemDtos.get(t).getAtcid());
//                    System.out.println(founditemDtos.get(t).getFdSbjt());
//                    System.out.println(founditemDtos.get(t).getFdSn());
//                    System.out.println(founditemDtos.get(t).getPrdtClNm());
//                    System.out.println(founditemDtos.get(t).getFdPrdtNm());
//                    System.out.println(founditemDtos.get(t).getFdYmd());
//                    System.out.println(founditemDtos.get(t).getDepPlace());
//                    System.out.println(founditemDtos.get(t).getRnum());
//                    System.out.println(founditemDtos.get(t).getClrNm());
//                    System.out.println(founditemDtos.get(t).getFdFilePathImg());
//                    System.out.println(founditemDtos.get(t).getAddr());
                    if(founditemDtos.get(t).getAtcid() == null){
                        founditemDtos.get(t).setAtcid("");
                    }
                    if(founditemDtos.get(t).getFdSbjt() == null){
                        founditemDtos.get(t).setFdSbjt("");
                    }
                    if(founditemDtos.get(t).getFdSn() == null){
                        founditemDtos.get(t).setFdSn("");
                    }
                    if(founditemDtos.get(t).getPrdtClNm() == null){
                        founditemDtos.get(t).setPrdtClNm("");
                    }
                    if(founditemDtos.get(t).getFdPrdtNm() == null){
                        founditemDtos.get(t).setFdPrdtNm("");
                    }
                    if(founditemDtos.get(t).getFdYmd() == null){
                        founditemDtos.get(t).setFdYmd("");
                    }
                    if(founditemDtos.get(t).getDepPlace() == null){
                        founditemDtos.get(t).setDepPlace("");
                    }
                    if(founditemDtos.get(t).getRnum() == null){
                        founditemDtos.get(t).setRnum("");
                    }
                    if(founditemDtos.get(t).getClrNm() == null){
                        founditemDtos.get(t).setClrNm("");
                    }
                    if(founditemDtos.get(t).getFdFilePathImg() == null){
                        founditemDtos.get(t).setFdFilePathImg("");
                    }
                    if(founditemDtos.get(t).getAddr() == null){
                        founditemDtos.get(t).setAddr("");
                    }

                    matchingAlarmDao.alert_item_write(memeberId,founditemDtos.get(t).getAtcid(),
                            founditemDtos.get(t).getFdSbjt(),founditemDtos.get(t).getFdSn(),founditemDtos.get(t).getPrdtClNm(),
                            founditemDtos.get(t).getFdPrdtNm(),founditemDtos.get(t).getFdYmd(),founditemDtos.get(t).getDepPlace(),
                            founditemDtos.get(t).getRnum(),founditemDtos.get(t).getClrNm(),founditemDtos.get(t).getFdFilePathImg(),
                            founditemDtos.get(t).getAddr());
                }

            }
//            //유기동물


        }
    }
}
