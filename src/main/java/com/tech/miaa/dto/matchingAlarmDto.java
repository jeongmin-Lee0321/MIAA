package com.tech.miaa.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class matchingAlarmDto {
   /*원진호_0415_수정*/
   /*
    * private String total_id; private String item_id; private String user_tel;
    * private String openclose; private String lostday; private String address;
    * private String item_name; private String upkind; private String upr_cd;
    * private String colorcd; private String sepcialmark; private String user_id;
    * private Date item_date; private String addressCode; private String total_id1;
    * private String filename;
    */
   
   private int total_id;
   private String user_id; // 사용자id
   private String atcid;  // 관리ID
   private String fdSbjt; // 게시글제목
   private String fdSn;  // 습득순번
   private String prdtClNm; // 물품분류명
   private String fdPrdtNm; // 물품명
   private String fdYmd;  // 습득일자
   private String depPlace; // 보관장소
   private String rnum;  // 검색결과 글번호(검색 후 결과값 페이지이동시에도 보존)
   private String clrNm; // 색상명
   private String fdFilePathImg; // 습득물이미지명(주소)
   private String addr; // 기관도로명주소

   
   
}