package com.tech.miaa.util;

import java.util.ArrayList;

public class PrdCode {

	public enum Prd {
		//대분류코드
		PRI000("컴퓨터"), PRJ000("휴대폰"), PRH000("지갑"), PRG000("전자기기"), PRD000("산업용품"), PRO000("귀금속"), PRZ000("기타물품"),
		PRC000("서류"), PRE000("스포츠용품"), PRF000("자동차"), PRL000("현금"), PRK000("의류"), PRQ000("쇼핑백"), PRR000("악기"),
		PRP000("카드"), PRM000("유가증권"), PRN000("증명서"), PRA000("가방"), PRB000("도서용품"), PRX000("유류품"), 
		
		
		//여기서 코드 줄바꿈 하지마세요. 띄어쓰기 되면 오류납니다.
		//여기서 코드 줄바꿈 하지마세요. 띄어쓰기 되면 오류납니다.
		//여기서 코드 줄바꿈 하지마세요. 띄어쓰기 되면 오류납니다.
		//여기서 코드 줄바꿈 하지마세요. 띄어쓰기 되면 오류납니다.
		//여기서 코드 줄바꿈 하지마세요. 띄어쓰기 되면 오류납니다.
		//여기서 코드 줄바꿈 하지마세요. 띄어쓰기 되면 오류납니다.
		//중분류 코드
		PRI100("삼성노트북"),PRI200("LG노트북"), PRI300("삼보노트북"), PRI400("기타"), PRI500("HP노트북"), PRI600("애플노트북"), PRJ100("삼성휴대폰"),
		PRJ200("LG휴대폰"), PRJ300("스카이휴대폰"), PRJ400("아이폰"), PRJ500("기타통신기기"), PRJ600("모토로라휴대폰"), PRJ900("기타휴대폰"),
		PRH100("여성용지갑"), PRH200("남성용지갑"), PRH300("기타지갑"), PRG100("PMP"), PRG200("MP3"), PRG300("PDA"), PRG400("카메라"),
		PRG500("전자수첩"), PRG600("기타용품"), PRG700("태블릿"), PRG800("스마트워치"), PRG900("무선이어폰"), PRD100("기타물품"), PRO100("반지"),
		PRO200("목걸이"), PRO300("귀걸이"), PRO400("시계"), PRO500("기타"), PRZ100("기타"), PRZ200("매장문화재"), PRZ600("선글라스"),
		PRZ700("안경"), PRC100("서류"), PRC200("기타물품"), PRE100("스포츠용품"), PRE200("수영복"), PRE300("수영물품"), PRF100("자동차열쇠"),
		PRF200("네비게이션"), PRF300("자동차번호판"), PRF400("기타용품"), PRF500("임시번호판"), PRL100("현금"), PRL200("수표"), PRL300("기타"),
		PRL400("외화"), PRK100("여성의류"), PRK200("남성의류"), PRK300("아기의류"), PRK400("기타의류"), PRK500("모자"), PRK600("신발"),
		PRQ100("쇼핑백"), PRR100("건반악기"), PRR200("관악기"), PRR300("타악기"), PRR400("현악기"), PRR900("기타악기"), PRP100("신용(체크)카드"),
		PRP200("일반카드"), PRP300("기타카드"), PRM100("어음"), PRM200("상품권"), PRM300("채권"), PRM400("기타"), PRN100("신분증"),
		PRN200("면허증"), PRN300("여권"), PRN400("기타"), PRN500("판결문"), PRA100("여성용가방"), PRA200("남성용가방"), PRA300("기타가방"),
		PRB100("학습서적"), PRB200("소설"), PRB300("컴퓨터서적"), PRB400("만화책"), PRB500("기타서적"), PRX100("유류품");

		private final String PrdCd;

		Prd(String PrdCd) {
			this.PrdCd = PrdCd;
		}

		public String getPrdName() {
			return PrdCd;
		}

	}

	public void UpperPrd() {
		System.out.println("대분류 목록");
		int cnt = 1;
		for (Prd c : Prd.values()) {
			if (c.name().substring(3).equals("000")) {
				System.out.println(cnt + " : " + c.getPrdName());
				cnt++;
			}
		}
	}

//	물품분류명입력시 코드값반환
	public Prd getPrdCode(String Prdname) {
		for (Prd c : Prd.values()) {
			if (c.getPrdName().equals(Prdname)) {
				return c;
			}
		}
		return null; // 일치하는 열거 상수를 찾지 못한 경우 null을 반환
	}

//	코드값 입력시 분류명 반환
	public String getPrdNameByCode(String code) {
		for (Prd c : Prd.values()) {
			if (c.name().equals(code)) {
				return c.getPrdName();
			}
		}
		return "해당하는 물품분류명이 없습니다";
	}

// 상위,하위분류
	public ArrayList<String> getLowerNameByCode(String numcode) {
		ArrayList<String> lowerPrd = new ArrayList<String>();
		for (Prd c : Prd.values()) {
			if (c.name().substring(0, 3).equals(numcode.substring(0, 3)) && !c.name().substring(3).equals("000")) {
				lowerPrd.add(c.getPrdName());
			}
		}
		return lowerPrd;
	}

}
