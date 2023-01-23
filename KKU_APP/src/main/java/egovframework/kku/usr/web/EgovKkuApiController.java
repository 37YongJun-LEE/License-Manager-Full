package egovframework.kku.usr.web;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.kku.usr.service.EgovKkuAppApiService;



@Controller
public class EgovKkuApiController {
	
	public static boolean isMpty(JSONObject jsonObj) {
        return (0 == jsonObj.length()) ? true : false;
    }
	
	@Resource(name="licenseApiService")								
	private EgovKkuAppApiService apiService;
	
	@RequestMapping(value="/licenseApi.do")
	public String licenseApi(HttpServletResponse response,
			 ModelMap model, HttpServletRequest request) throws Exception{
		
		
		
		
		return "kkuapp/web/license/licenseApi";
	}
	
	//한국산업인력공단_국가자격 종목 목록 정보
	@RequestMapping(value="/licenseApiSubject.do")
	@ResponseBody
	public String apiServiceSubject() throws Exception{
		
		//한국산업인력공단_국가자격 종목 목록 정보
		StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList"); //URL
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=67GOrkKyNEFjcIvlTOUBBRERZ9tzE845WR8p8qHfVlJtFN0eKz%2BDRrKdK3ZmaEEBRwfAMmu32w8n5QQ3phmBKg%3D%3D"); //Service Key
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("urlBuilder Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
        JSONObject jmJson = XML.toJSONObject(sb.toString());
        JSONObject jmResponse = (JSONObject)jmJson.get("response");
        JSONObject jmBody = (JSONObject)jmResponse.get("body");
        JSONObject jmItems = (JSONObject)jmBody.get("items");
        JSONArray jmItem = (JSONArray)jmItems.get("item"); 
        
        
        List<Map<String, Object>> jmListMap = new ArrayList<Map<String, Object>>();	
        
        for(int i=0;i<jmItem.length();i++){
        	JSONObject obj = (JSONObject)jmItem.get(i);
        	Map<String, Object> map = new HashMap<String, Object>();
        	map.put("qualgbcd",obj.get("qualgbcd"));
        	map.put("qualgbnm",obj.get("qualgbnm"));
        	map.put("seriescd",obj.get("seriescd"));
        	map.put("seriesnm",obj.get("seriesnm"));
        	map.put("jmcd",obj.get("jmcd"));
        	map.put("jmfldnm",obj.get("jmfldnm"));
        	map.put("obligfldcd",obj.get("obligfldcd"));
        	map.put("obligfldnm",obj.get("obligfldnm"));
        	map.put("mdobligfldcd",obj.get("mdobligfldcd"));
        	map.put("mdobligfldnm",obj.get("mdobligfldnm"));
        	jmListMap.add(map);
        }
        System.err.println("jmList 개수 = "+jmItem.length());
        String jmListResult = apiService.insertSubject(jmListMap); //자격종목 리스트 insert
    	
       
		String result = "";
		if(null  == null){
			result = "success";
		}else{
			result = "fail";
		}
		return result;
		
	}
	
	//한국산업인력공단_국가자격 시험일정 조회 서비스
	@RequestMapping(value="/licenseApiDate.do")
	@ResponseBody
	public String apiServiceDate() throws Exception{
		//한국산업인력공단_국가자격 종목 목록 정보
		StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList"); //URL
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=67GOrkKyNEFjcIvlTOUBBRERZ9tzE845WR8p8qHfVlJtFN0eKz%2BDRrKdK3ZmaEEBRwfAMmu32w8n5QQ3phmBKg%3D%3D"); //Service Key
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("urlBuilder Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
        JSONObject jmJson = XML.toJSONObject(sb.toString());
        JSONObject jmResponse = (JSONObject)jmJson.get("response");
        JSONObject jmBody = (JSONObject)jmResponse.get("body");
        JSONObject jmItems = (JSONObject)jmBody.get("items");
        JSONArray jmItem = (JSONArray)jmItems.get("item"); 
        
        
        List<Map<String, Object>> jmListMap = new ArrayList<Map<String, Object>>();	
        
        for(int i=0;i<jmItem.length();i++){
        	JSONObject obj = (JSONObject)jmItem.get(i);
        	Map<String, Object> map = new HashMap<String, Object>();
        	map.put("qualgbcd",obj.get("qualgbcd"));
        	map.put("qualgbnm",obj.get("qualgbnm"));
        	map.put("seriescd",obj.get("seriescd"));
        	map.put("seriesnm",obj.get("seriesnm"));
        	map.put("jmcd",obj.get("jmcd"));
        	map.put("jmfldnm",obj.get("jmfldnm"));
        	map.put("obligfldcd",obj.get("obligfldcd"));
        	map.put("obligfldnm",obj.get("obligfldnm"));
        	map.put("mdobligfldcd",obj.get("mdobligfldcd"));
        	map.put("mdobligfldnm",obj.get("mdobligfldnm"));
        	jmListMap.add(map);
        }
        System.err.println("jmList 개수 = "+jmItem.length());
    	
		for(int i=0;i<jmItem.length();i++){ // 종목코드 개수만큼 for문 돌리기
			//한국산업인력공단_국가자격 시험일정 조회 서비스
        	JSONObject obj = (JSONObject)jmItem.get(i); 
        	StringBuilder urlBuilder1 = new StringBuilder("http://apis.data.go.kr/B490007/qualExamSchd/getQualExamSchdList"); //url
            urlBuilder1.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=eYBSN0%2FylXe%2BLS685hL8tw7j0wfCG0ON%2FHr0Kh3gVS2nNoxOZEgYOLTOR1kzBXup9GZgM%2BdxGKxjj2pKf26%2BGw%3D%3D"); //Service Key
            urlBuilder1.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); //한 페이지 결과 수
            urlBuilder1.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //페이지번호
            urlBuilder1.append("&" + URLEncoder.encode("dataFormat","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); //응답 데이터 표준 형식 - xml / json (대소문자 구분 없음)
            urlBuilder1.append("&" + URLEncoder.encode("implYy","UTF-8") + "=" + URLEncoder.encode("2022", "UTF-8")); //시행년도
            urlBuilder1.append("&" + URLEncoder.encode("jmCd","UTF-8") + "=" + URLEncoder.encode(obj.get("jmcd").toString(), "UTF-8")); //종목코드 값 (예) 7910 : 한식조리 기능사(검정형)
            URL url1 = new URL(urlBuilder1.toString());
            HttpURLConnection conn1 = (HttpURLConnection) url1.openConnection();
            conn1.setRequestMethod("GET");
            conn1.setRequestProperty("Content-type", "application/json");
            System.out.println("urlBuilder1 Response code: " + conn1.getResponseCode());
            BufferedReader rd1;
            if(conn1.getResponseCode() >= 200 && conn1.getResponseCode() <= 300) {
                rd1 = new BufferedReader(new InputStreamReader(conn1.getInputStream()));
            } else {
                rd1 = new BufferedReader(new InputStreamReader(conn1.getErrorStream()));
            }
            StringBuilder sb1 = new StringBuilder();
            String line1;
            while ((line1 = rd1.readLine()) != null) {
                sb1.append(line1);
            }
            rd1.close();
            conn1.disconnect();
            
            JSONObject scheduleJson = new JSONObject(sb1.toString());
            JSONObject scheduleBody = (JSONObject)scheduleJson.get("body");
            JSONArray scheduleItem = (JSONArray)scheduleBody.get("items");
            
            
            System.err.println("items1.length=="+scheduleItem.length());
            List<Map<String, Object>> scheduleListMap = new ArrayList<Map<String, Object>>();
            
            for(int j=0;j<scheduleItem.length();j++){
            	JSONObject obj1 = (JSONObject)scheduleItem.get(j);
            	Map<String, Object> map1 = new HashMap<String, Object>();
            	map1.put("jmcd", obj.get("jmcd")); 
            	map1.put("implYy",obj1.get("implYy"));
            	map1.put("implSeq",obj1.get("implSeq"));
            	map1.put("qualgbCd",obj1.get("qualgbCd"));
            	map1.put("qualgbNm",obj1.get("qualgbNm"));
            	map1.put("description",obj1.get("description"));
            	map1.put("docRegStartDt",obj1.get("docRegStartDt"));
            	map1.put("docRegEndDt",obj1.get("docRegEndDt"));
            	map1.put("docExamStartDt",obj1.get("docExamStartDt"));
            	map1.put("docExamEndDt",obj1.get("docExamEndDt"));
            	map1.put("docPassDt",obj1.get("docPassDt"));
            	map1.put("pracRegStartDt",obj1.get("pracRegStartDt"));
            	map1.put("pracRegEndDt",obj1.get("pracRegEndDt"));
            	map1.put("pracExamStartDt",obj1.get("pracExamStartDt"));
            	map1.put("pracExamEndDt",obj1.get("pracExamEndDt"));
            	map1.put("pracPassDt",obj1.get("pracPassDt"));
            	scheduleListMap.add(map1);
            }
            
            System.err.println("jmListMap state:"+!scheduleListMap.isEmpty());
            System.err.println("jmListMap state:"+scheduleListMap);
            
            
            if(!scheduleListMap.isEmpty()){ //비어있는 리스트가 없는 경우만
                String scheduleListResult = apiService.insertDate(scheduleListMap); //시험일정  insert
            }
        }
		
		
		
		String result = "";
		if(null  == null){
			result = "success";
		}else{
			result = "fail";
		}
		return result;
	}
	@RequestMapping(value="/licenseStatistics.do")
	@ResponseBody
	public String apiServiceStatistics() throws Exception{

		//한국산업인력공단_국가자격취득자 현황 조회 서비스 
	 List<Map<String, Object>> statListMap = new ArrayList<Map<String, Object>>(); //년도랑 첫번째 for문 i값 변경-> total_Count(전체 결과 수)/50(한페이지당 결과 수)
       for(int i=1;i<=100;i++){
    	   StringBuilder urlBuilder2 = new StringBuilder("http://apis.data.go.kr/B490007/qualAcquPtcond/getQualAcquPtcond"); //URL
           urlBuilder2.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=67GOrkKyNEFjcIvlTOUBBRERZ9tzE845WR8p8qHfVlJtFN0eKz%2BDRrKdK3ZmaEEBRwfAMmu32w8n5QQ3phmBKg%3D%3D"); //Service Key
           urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); //한 페이지 결과 수
           urlBuilder2.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(Integer.toString(i), "UTF-8")); //페이지번호
           urlBuilder2.append("&" + URLEncoder.encode("dataFormat","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); //응답 데이터 표준 형식 - xml / json (대소문자 구분 없음)
           urlBuilder2.append("&" + URLEncoder.encode("acquYy","UTF-8") + "=" + URLEncoder.encode("2021", "UTF-8")); //자격취득년도
           urlBuilder2.append("&" + URLEncoder.encode("qualgbCd","UTF-8") + "=" + URLEncoder.encode("T", "UTF-8")); //자격구분코드 - T : 국가기술자격 - C : 과정평가형자격 - W : 일학습병행자격
           
           URL url2 = new URL(urlBuilder2.toString());
           HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
           conn2.setRequestMethod("GET");
           conn2.setRequestProperty("Content-type", "application/json");
           System.out.println("urlBuilder2 Response code: " + conn2.getResponseCode());
           System.err.println("i =="+i);
           BufferedReader rd2;
           if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
               rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
           } else {
               rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
           }
           StringBuilder sb2 = new StringBuilder();
           String line2;
           while ((line2 = rd2.readLine()) != null) {
               sb2.append(line2);
           }
           rd2.close();
           conn2.disconnect();
           System.err.println(sb2.toString());
           
           JSONObject statJson = new JSONObject(sb2.toString());
           JSONObject statBody = (JSONObject)statJson.get("body");
           JSONArray statItem = (JSONArray)statBody.get("items");
           
           
           for(int j=0;j<statItem.length();j++){
	           	JSONObject obj2 = (JSONObject)statItem.get(j);
	           	Map<String, Object> map2 = new HashMap<String, Object>();
	           	map2.put("acquYy",obj2.get("acquYy"));
	           	map2.put("acquMm",obj2.get("acquMm"));
	           	map2.put("qualgbCd",obj2.get("qualgbCd"));
	           	map2.put("qualgbNm",obj2.get("qualgbNm"));
	           	map2.put("rgnCd",obj2.get("rgnCd"));
	           	map2.put("rgnNm",obj2.get("rgnNm"));
	           	map2.put("ageGrupCd",obj2.get("ageGrupCd"));
	           	map2.put("ageGrupNm",obj2.get("ageGrupNm"));
	           	map2.put("genderCd",obj2.get("genderCd"));
	        	map2.put("genderNm",obj2.get("genderNm"));
	           	map2.put("seriesCd",obj2.get("seriesCd"));
	           	map2.put("seriesNm",obj2.get("seriesNm"));
	           	map2.put("jmCd",obj2.get("jmCd"));
	           	map2.put("jmNm",obj2.get("jmNm"));
	           	map2.put("acquCnt",obj2.get("acquCnt"));
	           	statListMap.add(map2);
           }
           
       }
      
      System.err.println("list2 state:"+!statListMap.isEmpty());
      if(!statListMap.isEmpty()){ //비어있는 리스트가 없는 경우만
          String insertResult2 = apiService.insertStatistics(statListMap); //국가자격취득자 현황 조회
      }
		
		String result = "";
		if(null  == null){
			result = "success";
		}else{
			result = "fail";
		}
		return result;
	}
	
	// 한국산업인력공단_국가자격 관심자격 정보
	@RequestMapping(value="/licenseApiInterest.do")
	@ResponseBody
	public String apiServiceInterest() throws Exception{

		// 한국산업인력공단_국가자격 관심자격 정보
        StringBuilder urlBuilder3 = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryAttenQualSVC/getList"); 
        urlBuilder3.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=67GOrkKyNEFjcIvlTOUBBRERZ9tzE845WR8p8qHfVlJtFN0eKz%2BDRrKdK3ZmaEEBRwfAMmu32w8n5QQ3phmBKg%3D%3D"); //Service Key
        urlBuilder3.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //페이지번호 - 기본값 : 1
        urlBuilder3.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("577", "UTF-8")); //페이지당 데이터 수 기본값 : 10
        URL url3 = new URL(urlBuilder3.toString());
        HttpURLConnection conn3 = (HttpURLConnection) url3.openConnection();
        conn3.setRequestMethod("GET");
        conn3.setRequestProperty("Content-type", "application/json");
        System.out.println("urlBuilder3 Response code: " + conn3.getResponseCode());
        BufferedReader rd3;
        if(conn3.getResponseCode() >= 200 && conn3.getResponseCode() <= 300) {
            rd3 = new BufferedReader(new InputStreamReader(conn3.getInputStream()));
        } else {
            rd3 = new BufferedReader(new InputStreamReader(conn3.getErrorStream()));
        }
        StringBuilder sb3 = new StringBuilder();
        String line3;
        while ((line3 = rd3.readLine()) != null) {
            sb3.append(line3);
        }
        rd3.close();
        conn3.disconnect();
        System.out.println(sb3.toString());
        JSONObject interJson = XML.toJSONObject(sb3.toString());
        JSONObject interResponse = (JSONObject)interJson.get("response");
        JSONObject interBody = (JSONObject)interResponse.get("body");
        JSONObject interItems = (JSONObject)interBody.get("items");
        JSONArray interItem = (JSONArray)interItems.get("item"); 
        
        List<Map<String, Object>> interListMap = new ArrayList<Map<String, Object>>();	
        
        for(int i=0;i<interItem.length();i++){
        	JSONObject obj3 = (JSONObject)interItem.get(i);
        	Map<String, Object> map3 = new HashMap<String, Object>();
        	map3.put("attenJmCd",obj3.get("attenJmCd"));
        	map3.put("jmNm",obj3.get("jmNm"));
        	map3.put("modifyDttm",obj3.get("modifyDttm"));
        	map3.put("recomJmCd1",obj3.get("recomJmCd1"));
        	map3.put("recomJmCd2",obj3.get("recomJmCd2"));
        	map3.put("recomJmNm1",obj3.get("recomJmNm1"));
        	map3.put("recomJmNm2",obj3.get("recomJmNm2"));
        	map3.put("regDttm",obj3.get("regDttm"));
        	interListMap.add(map3);
        }
        
        System.err.println("list3 state:"+!interListMap.isEmpty());
        System.err.println("list3"+interListMap);
        if(!interListMap.isEmpty()){
        	String insertResult3 = apiService.insertInterest(interListMap);
        }
		
		String result = "";
		if(null  == null){
			result = "success";
		}else{
			result = "fail";
		}
		return result;
	}
	// 자격증별 문제아이디 조회 & 문제아이디별 파일URL 조회
	@RequestMapping(value="/licenseApiQuestion.do")
	@ResponseBody
	public String apiServiceQuestion() throws Exception{

		//파일 저장경로 지정
		String globalPath = EgovProperties.getProperty("Globals.fileStorePath");
		String storePath = globalPath+"licenseFiles/";
		
		//API의 totalCnt = 전체개수/50(한 페이지 결과 수)
		int totalCnt = 7;
		
		 List<Map<String, Object>> idListMap = new ArrayList<Map<String, Object>>();
	        for(int i=1;i<=totalCnt;i++){ //i는 total_count/50 값
	        	// 자격증별 문제아이디 조회
	        	StringBuilder urlBuilder4 = new StringBuilder("http://apis.data.go.kr/B490007/openQst/getOpenQstList"); 
	            urlBuilder4.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=67GOrkKyNEFjcIvlTOUBBRERZ9tzE845WR8p8qHfVlJtFN0eKz%2BDRrKdK3ZmaEEBRwfAMmu32w8n5QQ3phmBKg%3D%3D"); //Service Key
	            urlBuilder4.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); //한 페이지 결과 수
	            urlBuilder4.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(Integer.toString(i), "UTF-8")); //페이지 번호
	            urlBuilder4.append("&" + URLEncoder.encode("dataFormat","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); //응답 데이터 표준 형식 - xml / json (대소문자 구분 없음)
	            urlBuilder4.append("&" + URLEncoder.encode("qualgbCd","UTF-8") + "=" + URLEncoder.encode("T", "UTF-8")); //자격구분코드 - T: 국가기술자격 - C: 과정평가형자격 - W: 일학습병행자격 현재 데이터에는 T밖에 없음
	            
	            URL url4 = new URL(urlBuilder4.toString());
	            HttpURLConnection conn4 = (HttpURLConnection) url4.openConnection();
	            conn4.setRequestMethod("GET");
	            conn4.setRequestProperty("Content-type", "application/json");
	            System.out.println("urlBuilder4 Response code: " + conn4.getResponseCode());
	            BufferedReader rd4;
	            if(conn4.getResponseCode() >= 200 && conn4.getResponseCode() <= 300) {
	                rd4 = new BufferedReader(new InputStreamReader(conn4.getInputStream()));
	            } else {
	                rd4 = new BufferedReader(new InputStreamReader(conn4.getErrorStream()));
	            }
	            StringBuilder sb4 = new StringBuilder();
	            String line4;
	            while ((line4 = rd4.readLine()) != null) {
	                sb4.append(line4);
	            }
	            rd4.close();
	            conn4.disconnect();
	            
	            JSONObject idJson = XML.toJSONObject(sb4.toString());
	            JSONObject idResponse = (JSONObject)idJson.get("response");
	            JSONObject idBody = (JSONObject)idResponse.get("body");
	            JSONObject idItems = (JSONObject)idBody.get("items");
	            JSONArray idItem = (JSONArray)idItems.get("item");
	            System.err.println("PageNum = "+i+", idItem.length = "+idItem.length());
	           
	            
	            
	            for(int j=0;j<idItem.length();j++){
	            	
	               	JSONObject obj4 = (JSONObject)idItem.get(j);
	               	Map<String, Object> map4 = new HashMap<String, Object>();
	               	map4.put("jmNm",obj4.get("jmNm"));
	               	map4.put("seriesCd",obj4.get("seriesCd"));
	               	map4.put("jmCd",obj4.get("jmCd"));
	               	map4.put("regDttm",obj4.get("regDttm"));
	               	map4.put("modDttm",obj4.get("modDttm"));
	               	map4.put("seriesNm",obj4.get("seriesNm"));
	               	map4.put("title",obj4.get("title"));
	               	map4.put("qualgbCd",obj4.get("qualgbCd"));
	               	map4.put("artlSeq",obj4.get("artlSeq"));
	               	map4.put("qualgbNm",obj4.get("qualgbNm"));
	               	idListMap.add(map4);
	               	System.err.println("artlSeq====="+obj4.get("artlSeq").toString()+" i == "+ i +" j === "+j );
	               	//문제아이디별 파일URL 조회
	               	StringBuilder urlBuilder5 = new StringBuilder("http://apis.data.go.kr/B490007/openQst/getOpenQst"); 
	                urlBuilder5.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=67GOrkKyNEFjcIvlTOUBBRERZ9tzE845WR8p8qHfVlJtFN0eKz%2BDRrKdK3ZmaEEBRwfAMmu32w8n5QQ3phmBKg%3D%3D"); //Service Key
	                urlBuilder5.append("&" + URLEncoder.encode("dataFormat","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); //응답 데이터 표준 형식 - xml / json (대소문자 구분 없음)
	                urlBuilder5.append("&" + URLEncoder.encode("qualgbCd","UTF-8") + "=" + URLEncoder.encode("T", "UTF-8")); //자격구분코드 - T: 국가기술자격 - C: 과정평가형자격 - W: 일학습병행자격
	                urlBuilder5.append("&" + URLEncoder.encode("artlSeq","UTF-8") + "=" + URLEncoder.encode(obj4.get("artlSeq").toString(), "UTF-8"));//게시물 아이디
	                URL url5 = new URL(urlBuilder5.toString());
	                HttpURLConnection conn5 = (HttpURLConnection) url5.openConnection();
	                conn5.setRequestMethod("GET");
	                conn5.setRequestProperty("Content-type", "application/json");
	                System.out.println("urlBuilder5 Response code: " + conn5.getResponseCode());
	                BufferedReader rd5;
	                if(conn5.getResponseCode() >= 200 && conn5.getResponseCode() <= 300) {
	                    rd5 = new BufferedReader(new InputStreamReader(conn5.getInputStream()));
	                } else {
	                    rd5 = new BufferedReader(new InputStreamReader(conn5.getErrorStream()));
	                }
	                StringBuilder sb5 = new StringBuilder();
	                String line5;
	                while ((line5 = rd5.readLine()) != null) {
	                    sb5.append(line5);
	                }
	                rd5.close();
	                conn5.disconnect();
	                
	                
	                JSONObject fileJson = XML.toJSONObject(sb5.toString());
	                JSONObject fileResponse = (JSONObject)fileJson.get("response");
	                JSONObject fileBody = (JSONObject)fileResponse.get("body");
	                
	                //첨부된 파일이 없는 경우
	                if(fileBody.get("fileList")==""){
	                	Map<String, Object> map5 = new HashMap<String, Object>();
	              		map5.put("artlSeq",fileBody.get("artlSeq"));
	                  	map5.put("title",fileBody.get("title"));
	                  	map5.put("contents",fileBody.get("contents"));
	                  	map5.put("regDttm",fileBody.get("regDttm"));
	                  	map5.put("modDttm",fileBody.get("modDttm"));
	                  	map5.put("qualgbCd",fileBody.get("qualgbCd"));
	                  	map5.put("qualgbNm",fileBody.get("qualgbNm"));
	                  	map5.put("seriesCd",fileBody.get("seriesCd"));
	                  	map5.put("seriesNm",fileBody.get("seriesNm"));
	                  	map5.put("jmCd",fileBody.get("jmCd"));
	                  	map5.put("jmNm",fileBody.get("jmNm"));
	                  	map5.put("fileNm", "");
	                  	map5.put("fileSn", "");
	                  	map5.put("fileUrl", "");
	                  	
                      	System.err.println("artlSeq="+fileBody.get("artlSeq"));
                      	System.err.println("jmNm="+fileBody.get("jmNm"));
                      	System.err.println("file = none");
	                  	
                      	String insertMap = apiService.insertQues(map5);
		                System.err.println("----------------------------------------");
	                }else{
	                	//첨부된 파일이 있는 경우
	                	
	                	JSONObject fileList = (JSONObject)fileBody.get("fileList");
	                    String strFl = fileList.toString();
	                  	if(!isMpty(fileList)){
	                  		if(strFl.charAt(strFl.length()-3) == '0'){ //리스트가 object인지 array인지 구분하기 위한 코드
	                  			Map<String, Object> map5 = new HashMap<String, Object>();
	                  			System.err.println("JSONObject");
//	                  			System.err.println("JSONObject"+strFl.charAt(strFl.length()-3));
	                  			JSONObject file = (JSONObject)fileList.get("file");
	                  			map5.put("artlSeq",fileBody.get("artlSeq"));
	                          	map5.put("title",fileBody.get("title"));
	                          	map5.put("contents",fileBody.get("contents"));
	                          	map5.put("regDttm",fileBody.get("regDttm"));
	                          	map5.put("modDttm",fileBody.get("modDttm"));
	                          	map5.put("qualgbCd",fileBody.get("qualgbCd"));
	                          	map5.put("qualgbNm",fileBody.get("qualgbNm"));
	                          	map5.put("seriesCd",fileBody.get("seriesCd"));
	                          	map5.put("seriesNm",fileBody.get("seriesNm"));
	                          	map5.put("jmCd",fileBody.get("jmCd"));
	                          	map5.put("jmNm",fileBody.get("jmNm"));
	                          	map5.put("fileNm", "["+fileBody.get("artlSeq") +"]"+file.get("fileNm"));
	                          	map5.put("fileSn", file.get("fileSn"));
	                          	map5.put("fileUrl", file.get("fileUrl"));
	                          	

                              	System.err.println("artlSeq="+fileBody.get("artlSeq"));
                              	System.err.println("jmNm="+fileBody.get("jmNm"));
                              	System.err.println("fileNm="+file.get("fileNm"));
	                          //파일 다운로드 하는 코드
	                    		String address = (String) file.get("fileUrl");
	                    		try {
	                    			URL url = new URL(address);
	                    			ReadableByteChannel rbc = Channels.newChannel(url.openStream());
	                    			FileOutputStream fos = new FileOutputStream(storePath+"["+fileBody.get("artlSeq") +"]"+file.get("fileNm"));
	                    			
	                    			fos.getChannel().transferFrom(rbc, 0,Long.MAX_VALUE);
	                    			fos.close();
	                    			
	                    			System.err.println("["+fileBody.get("artlSeq") +"]"+file.get("fileNm")+" 파일 다운로드 완료");
	                    			
	                    		} catch (Exception e) {
	                    			e.printStackTrace();
	                    		}
	                    		System.err.println("----------------------------------------");
	                    	
	                    		String insertMap = apiService.insertQues(map5);

	                          	
	                  		}else{
	                  			Map<String, Object> map5 = new HashMap<String, Object>();
	                  			System.err.println("JSONArray");
//	                  			System.err.println("JSONArray"+strFl.charAt(strFl.length()-3));
	                  			
	                  			JSONArray fileA = (JSONArray)fileList.get("file");
	                      		for(int k=0;k<fileA.length();k++){
	                      			JSONObject fobj = (JSONObject)fileA.get(k);
	                      			map5.put("artlSeq",fileBody.get("artlSeq"));
	                              	map5.put("title",fileBody.get("title"));
	                              	map5.put("contents",fileBody.get("contents"));
	                              	map5.put("regDttm",fileBody.get("regDttm"));
	                              	map5.put("modDttm",fileBody.get("modDttm"));
	                              	map5.put("qualgbCd",fileBody.get("qualgbCd"));
	                              	map5.put("qualgbNm",fileBody.get("qualgbNm"));
	                              	map5.put("seriesCd",fileBody.get("seriesCd"));
	                              	map5.put("seriesNm",fileBody.get("seriesNm"));
	                              	map5.put("jmCd",fileBody.get("jmCd"));
	                              	map5.put("jmNm",fileBody.get("jmNm"));
	                              	map5.put("fileNm", "["+fileBody.get("artlSeq") +"]"+fobj.get("fileNm"));
	                              	map5.put("fileSn", fobj.get("fileSn"));
	                              	map5.put("fileUrl", fobj.get("fileUrl"));
	                              	
	                              	System.err.println("artlSeq="+fileBody.get("artlSeq"));
	                              	System.err.println("jmNm="+fileBody.get("jmNm"));
	                              	System.err.println("fileNm="+fobj.get("fileNm"));
	                              	String address = (String) fobj.get("fileUrl");
	                              	
		                    		try {
		                    			URL url = new URL(address);
		                    			ReadableByteChannel rbc = Channels.newChannel(url.openStream());
		                    			FileOutputStream fos = new FileOutputStream(storePath+"["+fileBody.get("artlSeq") +"]"+fobj.get("fileNm"));
		                    			
		                    			fos.getChannel().transferFrom(rbc, 0,Long.MAX_VALUE);
		                    			fos.close();
		                    			
		                    			System.err.println("["+fileBody.get("artlSeq") +"]"+fobj.get("fileNm")+" 파일 다운로드 완료");
		                    			
		                    		} catch (Exception e) {
		                    			e.printStackTrace();
		                    		}
		                    		System.err.println("map5 = "+map5.get("fileNm")+" artlSeq"+map5.get("artlSeq"));
		                    		System.err.println("----------------------------------------");
		                    		
		                    		String insertMap = apiService.insertQues(map5);
	                      		}
	                      		
	                  		}
	                  	}
	                }
	                
	              	
	            }
	        }
	        
		
		String result = "";
		if(null  == null){
			result = "success";
		}else{
			result = "fail";
		}
		return result;
	}
	
	//추후 추가
	//한국산업인력공단_국가자격 등급별 응시자격 항목 정보 
	@RequestMapping(value="/licenseApiQual.do")
	@ResponseBody
	public String apiServiceQual() throws Exception{

		
		List<Map<String, Object>> qualifyList = new ArrayList<Map<String, Object>>(); //한국산업인력공단_국가기술자격 종목 정보
		StringBuilder urlBuilder6 = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryExamQualItemSVC/getList"); //URL
        urlBuilder6.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=67GOrkKyNEFjcIvlTOUBBRERZ9tzE845WR8p8qHfVlJtFN0eKz%2BDRrKdK3ZmaEEBRwfAMmu32w8n5QQ3phmBKg%3D%3D"); //Service Key
        urlBuilder6.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //페이지번호
        urlBuilder6.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("128", "UTF-8")); //한 페이지 결과 수
        URL url6 = new URL(urlBuilder6.toString());
        HttpURLConnection conn6 = (HttpURLConnection) url6.openConnection();
        conn6.setRequestMethod("GET");
        conn6.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn6.getResponseCode());
        BufferedReader rd6;
        if(conn6.getResponseCode() >= 200 && conn6.getResponseCode() <= 300) {
            rd6 = new BufferedReader(new InputStreamReader(conn6.getInputStream()));
        } else {
            rd6 = new BufferedReader(new InputStreamReader(conn6.getErrorStream()));
        }
        StringBuilder sb6 = new StringBuilder();
        String line6;
        while ((line6 = rd6.readLine()) != null) {
            sb6.append(line6);
        }
        rd6.close();
        conn6.disconnect();
        
        JSONObject qlJson = XML.toJSONObject(sb6.toString());
        JSONObject qlResponse = (JSONObject)qlJson.get("response");
        JSONObject qlBody = (JSONObject)qlResponse.get("body");
        JSONObject qlItems = (JSONObject)qlBody.get("items");
        JSONArray qlItem = (JSONArray)qlItems.get("item");
        
        
        for(int j=0;j<qlItem.length();j++){
        	Map<String, Object> map6 = new HashMap<String, Object>();
        	JSONObject qlObj = (JSONObject)qlItem.get(j);
        	map6.put("emqualCd", qlObj.get("emqualCd"));
        	map6.put("emqualDispNm", qlObj.get("emqualDispNm"));
        	map6.put("grdCd", qlObj.get("grdCd"));
        	map6.put("grdNm", qlObj.get("grdNm"));
        	map6.put("qualgbCd", qlObj.get("qualgbCd"));
        	map6.put("qualgbNm", qlObj.get("qualgbNm"));
        	System.err.println("map6="+qlObj);
        	qualifyList.add(map6);
        }
        
	       
		
		System.err.println("qualifyList state:"+qualifyList.get(0));
		
		if(!qualifyList.isEmpty()){
		   String insertResult6 = apiService.insertQaulify(qualifyList);
		 }
		
		
		String result = "";
		if(null  == null){
			result = "success";
		}else{
			result = "fail";
		}
		return result;
	}
}


