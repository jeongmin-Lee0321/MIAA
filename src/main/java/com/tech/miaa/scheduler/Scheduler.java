package com.tech.miaa.scheduler;

import com.tech.miaa.abdmApi.AbandonmentPublicSrvc;
import com.tech.miaa.abdmApi.AbdmPublic;
import com.tech.miaa.abdmApi.AbdmPublicItem;
import com.tech.miaa.dao.LostItemDao;
import com.tech.miaa.dao.MatchingAlarmDao;
import com.tech.miaa.dao.MemberDao;
import com.tech.miaa.dao.MissingAnimalDao;
import com.tech.miaa.dto.AnimalDto;
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
//    @Scheduled(cron = "0/20 * * * * *")
    @Scheduled(cron = "10 * * * * *")
    public void updateAnimalAlertList() {
        System.out.println("테스트 : " + new Date());
        MemberDao dao = sqlSession.getMapper(MemberDao.class);
        List<MemberDto> memberDtoList = dao.getMembers();
        MatchingAlarmDao matchingAlarmDao = sqlSession.getMapper(MatchingAlarmDao.class);

        for (int i = 0; i < memberDtoList.size(); i++) {
            String memeberId = memberDtoList.get(i).getUser_id();
            System.out.println(memeberId);

            //분실물
            LostItemDao lostItemDao = sqlSession.getMapper(LostItemDao.class);
            List<ItemDto> itemDtos =lostItemDao.get_lost_items(memeberId);
            for (int j = 0; j <itemDtos.size(); j++){
                //api 호출
                FounditemService founditemService = new FounditemService();
                String a = founditemService.found_item_search_AreaPd(itemDtos.get(i));
                ArrayList<FounditemDto> founditemDtos = founditemService.getFoundList(a);
                //db 저장
                for (FounditemDto dto : founditemDtos){
                    if(dto.getAtcid() == null){
                        dto.setAtcid("");
                    }
                    if(dto.getFdSbjt() == null){
                        dto.setFdSbjt("");
                    }
                    if(dto.getFdSn() == null){
                        dto.setFdSn("");
                    }
                    if(dto.getPrdtClNm() == null){
                        dto.setPrdtClNm("");
                    }
                    if(dto.getFdPrdtNm() == null){
                        dto.setFdPrdtNm("");
                    }
                    if(dto.getFdYmd() == null){
                        dto.setFdYmd("");
                    }
                    if(dto.getDepPlace() == null){
                        dto.setDepPlace("");
                    }
                    if(dto.getRnum() == null){
                        dto.setRnum("");
                    }
                    if(dto.getClrNm() == null){
                        dto.setClrNm("");
                    }
                    if(dto.getFdFilePathImg() == null){
                        dto.setFdFilePathImg("");
                    }
                    if(dto.getAddr() == null){
                        dto.setAddr("");
                    }
                    matchingAlarmDao.alert_item_write2(itemDtos.get(i).getTotal_id(),memeberId,dto.getAtcid(),
                            dto.getFdSbjt(),dto.getFdSn(),dto.getPrdtClNm(),
                            dto.getFdPrdtNm(),dto.getFdYmd(),dto.getDepPlace(),
                            dto.getRnum(),dto.getClrNm(),dto.getFdFilePathImg(),
                            dto.getAddr());

                    try {
                        Thread.sleep(50);
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
//            //유기동물
            MissingAnimalDao missingAnimalDao = sqlSession.getMapper(MissingAnimalDao.class);
            List<AnimalDto> animalDtos = missingAnimalDao.get_missing_animals(memeberId);
            for (AnimalDto dto : animalDtos) {
                List<AbdmPublicItem> abdmPublicItems = AbandonmentPublicSrvc.abandonmentPublic(dto).getItems();
                for (AbdmPublicItem item : abdmPublicItems) {
                    matchingAlarmDao.alert_animal_write2(dto.getTotal_id(), memeberId, item.getDesertionNo(),
                            item.getFilename(), item.getHappenDt(), item.getHappenPlace(), item.getKindCd(),
                            item.getColorCd(), item.getAge(), item.getWeight(), item.getNoticeNo(), item.getNoticeSdt(),
                            item.getNoticeEdt(), item.getPopfile(), item.getProcessState(), item.getSexCd(), item.getNeuterYn(),
                            item.getSpecialMark(), item.getCareNm(), item.getCareTel(), item.getCareAddr(), item.getOrgNm(), item.getChargeNm(),
                            item.getOfficetel(), item.getNoticeComment());
                }
                try {
                    Thread.sleep(50);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}
