package com.tech.miaa.dto;

import com.tech.miaa.abdmApi.AbandonmentPublicSrvc;
import com.tech.miaa.abdmApi.AbdmSido;
import com.tech.miaa.abdmApi.AbdmSigungu;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

@Service
public class test implements InitializingBean {
    @Override
    public void afterPropertiesSet() throws Exception {
        init();
    }

    public void init(){
        AbdmSido sido = AbandonmentPublicSrvc.getSido();
        for (int i=0; i<sido.getItems().size(); i++){
            AbdmSigungu sigungu = AbandonmentPublicSrvc.getSigungu(sido.getItems().get(i).getOrgCd());
        }
    }
}
