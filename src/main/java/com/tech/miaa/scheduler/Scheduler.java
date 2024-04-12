package com.tech.miaa.scheduler;

import com.tech.miaa.abdmApi.AbandonmentPublicSrvc;
import com.tech.miaa.dto.AnimalSearchDto;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Scheduler {

    // sec/min/hour/day/month/day of week/year
    // 0-59/0-59/0~23/1-31/1-12/0-6/생략가능
    @Scheduled(cron = "10 * * * * *")
    public void updateAnimalAlertList(){
        System.out.println("테스트 : "+ new Date());
        AnimalSearchDto dto = new AnimalSearchDto();
//        AbandonmentPublicSrvc.abandonmentPublic();
    }
}
