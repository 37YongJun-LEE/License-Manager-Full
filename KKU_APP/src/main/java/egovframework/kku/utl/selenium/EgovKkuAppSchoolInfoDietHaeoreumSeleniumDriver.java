package egovframework.kku.utl.selenium;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Controller;

import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;

//해오름학사 학식정보 크롤러
public class EgovKkuAppSchoolInfoDietHaeoreumSeleniumDriver {

	private WebDriver driver;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "/root/Desktop/chromedriver";
//	public static String WEB_DRIVER_PATH = "C:/eGovFrameDev-3.10.0-64bit/webdriver/chromedriver107/chromedriver.exe";

	public EgovKkuAppSchoolInfoDietHaeoreumSeleniumDriver() {
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
	
	public String[][][] useDriver(String url) throws Exception {
		driver.get(url);
		Thread.sleep(2000);
		driver.findElement(By.cssSelector("#wrap > div.sitemap > details > div > div > div > dl:nth-child(3) > dd > ul > li:nth-child(3) > ul > li:nth-child(4) > a > span")).click();
		Thread.sleep(1000);
		
		String[][][] dataList2  = new String[3][5][6];
		for(int i=1; i<4; i++) {
			for(int j=2; j<7; j++) {
				String dataElement = driver.findElements(By.cssSelector("#container > section > div.page_conts_inner > div > div.week_menu_body > div > table > tbody > tr:nth-child("+i+") > td:nth-child("+j+") > p")).get(0).getText();
				Thread.sleep(1000);
				
				List<String> dataList = Arrays.asList(dataElement.split("\n"));
				
//				//칼로리 정보 (해오름학사는 칼로리 정보 없음)
//				int lastIndex = dataList.size()-1;
//				String caloInfo = dataList.get(lastIndex); 
				
				//메뉴 정보
				String menuInfo = "";
				for (int k=0; k<(dataList.size())-1; k++) {
					menuInfo += dataList.get(k);
					menuInfo += "\n";
				}
				
				dataList2[i-1][j-2][0] = menuInfo; 
//				dataList2[i-1][j-2][1] = caloInfo;
				
				switch(i) {
				case 1:
					dataList2[i-1][j-2][2] = "아침";
					break;
				case 2:
					dataList2[i-1][j-2][2] = "점심";
					break;
				case 3:
					dataList2[i-1][j-2][2] = "저녁";
					break;
				}
				
				switch(j) {
				case 2:
					dataList2[i-1][j-2][3] = "월";
					break;
				case 3:
					dataList2[i-1][j-2][3] = "화";
					break;
				case 4:
					dataList2[i-1][j-2][3] = "수";
					break;
				case 5:
					dataList2[i-1][j-2][3] = "목";
					break;
				case 6:
					dataList2[i-1][j-2][3] = "금";
					break;
				case 7:
					dataList2[i-1][j-2][3] = "토";
					break;
				case 8:
					dataList2[i-1][j-2][3] = "일";
					break;
				}
				
				dataList2[i-1][j-2][4] = "해오름학사";
				
				String date = driver.findElements(By.cssSelector("#container > section > div.page_conts_inner > div > div.week_menu_body > div > table > thead > tr > th:nth-child("+j+") > p")).get(0).getText();
				date = date.replace("(", "");
				date = date.replace(")", "");
				dataList2[i-1][j-2][5] = date;
			}
		}
		quitDriver();
		return dataList2;
	}
	

	private void quitDriver() {
		driver.quit();
	}

}
