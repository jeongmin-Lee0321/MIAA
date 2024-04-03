
package com.tech.miaa.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.ui.Model;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.tech.miaa.dto.FounditemDto;
import com.tech.miaa.serviceInter.FounditemServiceInter;
import com.tech.miaa.util.PrdCode;

public class FounditemService implements FounditemServiceInter {

	public static String ServiceKey = "XDBJ0UVn425mRe%2Fi9JDxdSEyLFFr1xKIRRPGJGZDKuR6QfNj4CbpIg0V%2FGxI6VbU8FM6e3tr70yQNMZ13cd%2BJw%3D%3D"; // 서비스키
	private int total = 0;

	@Override
	// 분류별, 지역별, 기간별 습득물 정보 조회
	// GetLosfundInfoAccToClAreaPd
	public String found_item_search_AreaPd(Model model) {
		// TODO Auto-generated method stub
		PrdCode prd = new PrdCode();
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String result_code = ""; // 전체 결과값
		String PRDT_CL_CD_01 = ""; // 대분류
		String PRDT_CL_CD_02 = ""; // 중분류
//		String FD_COL_CD = ""; // 색상코드
		String START_YMD = ""; // 시작일
		String END_YMD = ""; // 종료일
		String N_FD_LCT_CD=""; // 습득지역(코드)
		
		System.out.println(request.getParameter("cityname") + " , " + request.getParameter("cityname2"));
		
		if (request.getParameter("cityname2").equals("") && !request.getParameter("cityname").equals(""))
			N_FD_LCT_CD = request.getParameter("cityname");
		else if(!request.getParameter("cityname2").equals("") && !request.getParameter("cityname2").isEmpty())
			N_FD_LCT_CD = request.getParameter("cityname2");
		String pageNo = request.getParameter("pageNo");

		if ((!request.getParameter("prd_mainCategory").equals(""))&&(!request.getParameter("prd_mainCategory").isEmpty()))
			PRDT_CL_CD_01 = request.getParameter("prd_mainCategory");
		
		System.out.println("중분류원제목 : "+request.getParameter("prd_subCategory"));
		System.out.println("중분류코드:"+PRDT_CL_CD_02);
		if ((!request.getParameter("prd_subCategory").equals(""))&&(!request.getParameter("prd_subCategory").isEmpty()))
			PRDT_CL_CD_02 = prd.getPrdCode(request.getParameter("prd_subCategory").replace(" ","")).toString();
		System.out.println("중분류코드:"+PRDT_CL_CD_02);
//		if (!request.getParameter("FD_COL_CD").equals(""))
//			FD_COL_CD = request.getParameter("FD_COL_CD");
		if (!request.getParameter("START_YMD").equals(""))
			START_YMD = request.getParameter("START_YMD");
		if (!request.getParameter("END_YMD").equals(""))
			END_YMD = request.getParameter("END_YMD");
		
		if (pageNo == null || pageNo.equals(""))
			pageNo = "1";

		System.out.println("인터내부\n" + "대분류 : " + PRDT_CL_CD_01 + "\n중분류 : " + PRDT_CL_CD_02 + "\n시작종료일 : " + START_YMD
				+ "~" + END_YMD + "\n도시 : " + N_FD_LCT_CD);

		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundInfoAccToClAreaPd"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + ServiceKey); /* Service Key 서비스키 */
			if (!PRDT_CL_CD_01.equals(""))
				urlBuilder.append("&" + URLEncoder.encode("PRDT_CL_CD_01", "UTF-8") + "="
						+ URLEncoder.encode(PRDT_CL_CD_01, "UTF-8")); /* 대분류 */
			if (!PRDT_CL_CD_02.equals(""))
				urlBuilder.append("&" + URLEncoder.encode("PRDT_CL_CD_02", "UTF-8") + "="
						+ URLEncoder.encode(PRDT_CL_CD_02, "UTF-8")); /* 중분류 */
//			if (!FD_COL_CD.equals(""))
//				urlBuilder.append("&" + URLEncoder.encode("FD_COL_CD", "UTF-8") + "="
//						+ URLEncoder.encode(FD_COL_CD, "UTF-8")); /* 습득물 색상 */
			if (!START_YMD.equals(""))
				urlBuilder.append("&" + URLEncoder.encode("START_YMD", "UTF-8") + "="
						+ URLEncoder.encode(START_YMD.replace("-", ""), "UTF-8")); /* 검색시작일 */
			if (!END_YMD.equals(""))
				urlBuilder.append("&" + URLEncoder.encode("END_YMD", "UTF-8") + "="
						+ URLEncoder.encode(END_YMD.replace("-", ""), "UTF-8")); /* 검색종료일 */
			if (!N_FD_LCT_CD.equals(""))
				urlBuilder.append("&" + URLEncoder.encode("N_FD_LCT_CD", "UTF-8") + "="
						+ URLEncoder.encode(N_FD_LCT_CD, "UTF-8")); /* 습득지역 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /* 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("100", "UTF-8")); /* 목록 건수 우선 10으로 설정 */
			System.out.println(urlBuilder.toString());
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();

			/*
			 * 장문의 xml코드를 String화 해서 result_code에 저장 후 parsing작업
			 */
			result_code = sb.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result_code;

	}

	// 습득물 명칭, 보관 장소별 습득물 정보 조회
	// GetLosfundInfoAccTpNmCstdyPlace
	@Override
	public String found_item_search_Place(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String result_code = ""; // 전체 결과값
//		public static ArrayList<Lostitem> list = new ArrayList<Lostitem>(); // 습득물품 리스트
		String PRDT_NM = request.getParameter("PRDT_NM"); // 물품명
		String DEP_PLACE = request.getParameter("DEP_PLACE"); // 보관장소
		String pageNo = request.getParameter("pageNo"); // 페이지번호

		if (PRDT_NM == null)
			PRDT_NM = "";
		if (DEP_PLACE == null)
			DEP_PLACE = "";
		if (pageNo == null || pageNo.equals(""))
			pageNo = "1";

		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1320000/LosfundInfoInqireService/getLosfundInfoAccTpNmCstdyPlace"); /*
																												 * URL
																												 */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + ServiceKey); /* Service Key */
			if (!PRDT_NM.equals(""))
				urlBuilder.append("&" + URLEncoder.encode("PRDT_NM", "UTF-8") + "="
						+ URLEncoder.encode(PRDT_NM, "UTF-8")); /* 물품명 */
			if (!DEP_PLACE.equals(""))
				urlBuilder.append("&" + URLEncoder.encode("DEP_PLACE", "UTF-8") + "="
						+ URLEncoder.encode(DEP_PLACE, "UTF-8")); /* 보관장소 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /* 페이지 번호 */
			urlBuilder.append(
					"&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 목록 건수 */
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			System.out.println(sb.toString());

			/*
			 * 장문의 xml코드를 String화 해서 result_code에 저장 후 parsing작업
			 */
			result_code = sb.toString();
			return result_code;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result_code;
	}

	private static String getElementValue(Element parentElement, String tagName) {
		NodeList nodeList = parentElement.getElementsByTagName(tagName);
		if (nodeList.getLength() > 0) {
			Node node = nodeList.item(0);
			if (node.getFirstChild() != null) {
				return node.getFirstChild().getNodeValue();
			}
		}
		return null;
	}

	public ArrayList<FounditemDto> getFoundList(String rsCode) {

		ArrayList<FounditemDto> list = new ArrayList<FounditemDto>();

		try {
			// XML 문자열을 Document 객체로 파싱
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(new InputSource(new StringReader(rsCode)));

			// <item> 요소들을 NodeList로 가져옴
			NodeList itemList = doc.getElementsByTagName("item");
			NodeList totalCountList = doc.getElementsByTagName("totalCount"); // 검색결과 갯수
			total = Integer.parseInt(totalCountList.item(0).getTextContent());

			// <item> 요소들을 순회하며 파싱
			for (int i = 0; i < itemList.getLength(); i++) {
				Node itemNode = itemList.item(i);
				if (itemNode.getNodeType() == Node.ELEMENT_NODE) {
					Element itemElement = (Element) itemNode;
					FounditemDto fitem = new FounditemDto();
					// 각 요소의 값 가져오기
					String atcId = getElementValue(itemElement, "atcId");
					String clrNm = getElementValue(itemElement, "clrNm");
					String depPlace = getElementValue(itemElement, "depPlace");
					String fdFilePathImg = getElementValue(itemElement, "fdFilePathImg");
					String fdPrdtNm = getElementValue(itemElement, "fdPrdtNm");
					String fdSbjt = getElementValue(itemElement, "fdSbjt");
					String fdSn = getElementValue(itemElement, "fdSn");
					String fdYmd = getElementValue(itemElement, "fdYmd");
					String prdtClNm = getElementValue(itemElement, "prdtClNm");
					String rnum = getElementValue(itemElement, "rnum");
					String addr = getElementValue(itemElement, "addr");

					// Item 객체 생성하여 리스트에 추가
					fitem.setAtcid(atcId);
					fitem.setFdSbjt(clrNm);
					fitem.setDepPlace(depPlace);
					if (fdFilePathImg.isEmpty())
						fitem.setFdFilePathImg("https://www.lost112.go.kr/lostnfs/images/sub/img02_no_img.gif");
					else
						fitem.setFdFilePathImg(fdFilePathImg);
					fitem.setFdPrdtNm(fdPrdtNm);
					fitem.setFdSbjt(fdSbjt);
					fitem.setFdSn(fdSn);
					fitem.setFdYmd(fdYmd);
					fitem.setPrdtClNm(prdtClNm);
					fitem.setRnum(rnum);
					fitem.setAddr(addr);

					list.add(fitem);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;

	}

	public int getTotal() {
		return total;
	}

//	public ArrayList<FounditemDto> getlstList(String rsCode, String sel) {
//
//		ArrayList<FounditemDto> list = new ArrayList<FounditemDto>();
//
//		try {
//			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//			DocumentBuilder builder = factory.newDocumentBuilder();
//			Document doc = builder.parse(new InputSource(new StringReader(rsCode)));
//			/*
//			 * 각 item별로 List형태로 저장
//			 */
//			NodeList atcidList = doc.getElementsByTagName("atcId"); // 관리번호
////			NodeList clrNmList = doc.getElementsByTagName("clrNm"); // 색상명
//			NodeList depPlaceList = doc.getElementsByTagName("depPlace"); // 보관장소
//			NodeList fdFilePathImgList = null;
//			NodeList addrList = null;
//			NodeList fdPrdtNmList = doc.getElementsByTagName("fdPrdtNm"); // 물품명
//			NodeList prdtClNmList = doc.getElementsByTagName("prdtClNm"); // 물품 분류명
//			NodeList fdSbjtList = doc.getElementsByTagName("fdSbjt"); // 게시제목
//			NodeList fdSnList = doc.getElementsByTagName("fdSn"); // 습득순번
//			NodeList fdYmdList = doc.getElementsByTagName("fdYmd"); // 습득일자
//			NodeList rnumList = doc.getElementsByTagName("rnum"); // 일련번호
//			if (sel.equals("AreaPd") || sel.equals("Place"))
//				fdFilePathImgList = doc.getElementsByTagName("fdFilePathImg"); // 습득물 이미지
//			else if (sel.equals("AccToLc"))
//				addrList = doc.getElementsByTagName("addr"); // 기관도로명주소
//			NodeList totalCountList = doc.getElementsByTagName("totalCount"); // 검색결과 갯수
//			total = Integer.parseInt(totalCountList.item(0).getTextContent());
//
//			/*
//			 * list내 각item별 출력
//			 */
//
//			for (int i = 0; i < atcidList.getLength(); i++) {
//				FounditemDto fitem = new FounditemDto();
//				fitem.setRnum(rnumList.item(i).getTextContent()); // 검색결과 중 글번호
//				if (sel.equals("AreaPd") || sel.equals("Place"))
//					fitem.setFdFilePathImg(fdFilePathImgList.item(i).getTextContent()); // 이미지
//				else
//					fitem.setFdFilePathImg("https://www.lost112.go.kr/lostnfs/images/sub/img02_no_img.gif");
//				if (sel.equals("AccToLc"))
//					fitem.setAddr(addrList.item(i).getTextContent());
//				else
//					fitem.setAddr("");
//				fitem.setAtcid(atcidList.item(i).getTextContent());
//				fitem.setFdSbjt(fdSbjtList.item(i).getTextContent());
//				fitem.setFdPrdtNm(fdPrdtNmList.item(i).getTextContent());
//				fitem.setPrdtClNm(prdtClNmList.item(i).getTextContent());
//				fitem.setFdYmd(fdYmdList.item(i).getTextContent());
//				fitem.setDepPlace(depPlaceList.item(i).getTextContent());
//				fitem.setFdSn(fdSnList.item(i).getTextContent());
//
//				list.add(fitem);
//			}
//
//			System.out.println("검색결과 : 총" + totalCountList.item(0).getTextContent() + "개");
//		} catch (SAXException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ParserConfigurationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return list;
//
//	}

}
