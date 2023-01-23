package egovframework.kku.utl.selenium;

import java.time.temporal.TemporalAccessor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Controller;

import com.ibm.icu.text.SimpleDateFormat;

import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

//모시래학사 학식정보 크롤러
public class EgovKkuAppLicenseDataSeleniumDriver {

	private WebDriver driver;
	private String tempStr1, tempStr2, tempStr3;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "/root/Desktop/chromedriver";
//	public static String WEB_DRIVER_PATH = "C:/eGovFrameDev-3.10.0-64bit/webdriver/chromedriver107/chromedriver.exe";
	public int code = 1;

	public EgovKkuAppLicenseDataSeleniumDriver() {
		chrome();
	}
	
	public void chrome() {
		System.setProperty(WEB_DRIVER_ID,  WEB_DRIVER_PATH);
		
		//webDriver 옵션 설정
		ChromeOptions options = new ChromeOptions();
//		options.setHeadless(true);
		options.addArguments("--start-fullscreen");
//		options.addArguments("--window-size='1280,1600'");
		options.addArguments("--lang=ko");
		options.addArguments("--no-sandbox");
		options.addArguments("--disable-dev-shm-usage");
		options.addArguments("--disable-gpu");
		options.setCapability("ignoreProtectedModeSettings",  true);
		
		//webDriver 생성
		driver = new ChromeDriver(options);
		driver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
	}
	
	
	
	public List<EgovMap> useDriver(String url) throws Exception {
		driver.get(url);
		Thread.sleep(1000);
		List<EgovMap> dataList = new ArrayList<EgovMap>();
		List<String> tempList = new ArrayList<>();
		for(int i=3; i<=6; i++) {
			try{
				for(int j=1; j<=8; j++) {
					String dataElement;
					try{
						for(int k=1; k<=8; k++){
						dataElement = driver.findElement(By.cssSelector("div.table-responsive-md > table > tbody:nth-child("+i+") > tr:nth-child("+j+") > td:nth-child("+k+")")).getText();
						dataElement = dataElement.replaceFirst("\\R", ","); // 줄 바꿈있을 때 콤마로 replace
						if(dataElement.isEmpty()){
							dataElement = driver.findElement(By.cssSelector("div.table-responsive-md > table > tbody:nth-child("+i+") > tr:nth-child("+j+") > td:nth-child("+k+") > div:nth-child(1) > img")).getAttribute("alt");
							dataElement += ", " + driver.findElement(By.cssSelector("div.table-responsive-md > table > tbody:nth-child("+i+") > tr:nth-child("+j+") > td:nth-child("+k+") > div:nth-child(2) > img")).getAttribute("alt");
						}
						//11.30 ~ 작업중
						if(dataElement.contains("~")){
							String[] date = dataElement.split("~");
							String date1 = dateToFormat(date[0]);
							String date2 = dateToFormat(date[1]);
							tempList.add(date1);
							tempList.add(date2);
						}
						else{
							if(dataElement.contains(".")){
								dataElement = dateToFormat(dataElement);
							}
							tempList.add(dataElement);
						}
						
						Thread.sleep(1000);
						
						}
					} catch (Exception e) { // rowspan때문에 td 개수 다를 때도 add 해주기 위함
						System.err.println("catch 1");
						addMap(dataList, tempList);
						//여기서 map에 담아야 됨.
						tempList.clear();
						continue;
					}
					//여기서 map에 담아야됨.
					addMap(dataList, tempList);
					tempList.clear();
				}
			} catch (Exception e) { // tbody 섹션 하나 끝날 때 걸림
				System.err.println("catch 2");
				continue;
			}
		}
		quitDriver();
		return dataList;
	}
	
	//Map에 add 해주는 함수
	public List<EgovMap> addMap(List<EgovMap> dataList, List<String> tempList) throws Exception {
		System.err.println(tempList);
		
		EgovMap map = new EgovMap();
		if(tempList.size() >= 9){ // 4개일거임(rowspan로 나눠지는 첫줄)
			tempStr1 = tempList.get(0);
			tempStr2 = tempList.get(1);
			tempStr3 = "D00" + code++;
			map.put("qualName", "데이터자격검정");
			map.put("subjectName", tempStr1);
			map.put("seriesName", tempStr2);
			map.put("subjectCd", tempStr3);
			if(tempList.get(2).contains("실기")){
				map.put("description", tempList.get(2)); // 시험 설명
				map.put("ptestAplcStartdt", tempList.get(3)); // 실기 원서접수 시작일
				map.put("ptestAplcEnddt", tempList.get(4)); // 실기 원서접수 종료일
				//map.put("", tempList.get(5)); // 수험표 발급 일자인데 DB에 없어서 저장 X
				map.put("ptestStartdt", tempList.get(6)); // 시험일
				map.put("ptestPassdt", tempList.get(7));  // 결과발표일
				//map.put("", tempList.get(8)); // get(9)랑 증빙서류 제출일인데 DB에 없어서 저장 X
			} else{ // "필기"일 때(실기가 없는건 다 필기) // w랑 p만 다르고 인덱스 설명은 위와 같음
				map.put("description", tempList.get(2));
				map.put("wtestAplcStartdt", tempList.get(3));  
				map.put("wtestAplcEnddt", tempList.get(4));
				//map.put("", tempList.get(5)); 
				map.put("wtestStartdt", tempList.get(6));
				map.put("wtestPassdt", tempList.get(7));
			}
			
		} else { // size == 6 (rowspan이 없는 테이블은 위에 str1, str2를 받아서 저장)
			map.put("qualName", "데이터자격검정");
			map.put("subjectName", tempStr1);
			map.put("seriesName", tempStr2);
			map.put("subjectCd", tempStr3);
			if(tempList.get(0).contains("실기")){
				map.put("description", tempList.get(0));
				map.put("ptestAplcStartdt", tempList.get(1));
				map.put("ptestAplcEnddt", tempList.get(2));
				//map.put("", tempList.get(3)); 
				map.put("ptestStartdt", tempList.get(4));
				map.put("ptestPassdt", tempList.get(5));
			}else { // "필기"일 때(실기가 없는건 다 필기)
				map.put("description", tempList.get(0));
				map.put("wtestAplcStartdt", tempList.get(1));
				map.put("wtestAplcEnddt", tempList.get(2));
				//map.put("", tempList.get(3)); 
				map.put("wtestStartdt", tempList.get(4));
				map.put("wtestPassdt", tempList.get(5));
			}
		}
		System.err.println(map);
		dataList.add(map);
		
		return dataList;
	}
	
	public String dateToFormat(String date) throws Exception {
		String result = "";
		String[] dateList = date.split("\\.");
		String temp1 = dateList[0];
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = Integer.parseInt(dateList[0].replaceAll("[^0-9]", ""));
		int day = Integer.parseInt(dateList[1].replaceAll("[^0-9]", ""));
		cal.set(year, month-1, day);
		Date calDate = cal.getTime();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		result = df.format(calDate);

		return result;
	}

	private void quitDriver() {
		driver.quit();
	}

}
