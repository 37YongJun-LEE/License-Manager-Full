package egovframework.kku.utl.selenium;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Controller;

import egovframework.com.utl.jsoup.EgovKkuAppSchoolInfoJsoupCrawler;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;

//모시래학사 학식정보 크롤러
public class EgovKkuAppSchoolInfoNoticeSeleniumDriver {

	private WebDriver driver;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "/root/Desktop/chromedriver";
//	public static String WEB_DRIVER_PATH = "C:/eGovFrameDev-3.10.0-64bit/webdriver/chromedriver107/chromedriver.exe";

	public EgovKkuAppSchoolInfoNoticeSeleniumDriver() {
		chrome();
	}
	
	public void chrome() {
		System.setProperty(WEB_DRIVER_ID,  WEB_DRIVER_PATH);
		
		//webDriver 옵션 설정
		ChromeOptions options = new ChromeOptions();
		options.setHeadless(true);
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
	
	public String[][] useDriver(String url, List<Integer> IndexList) throws Exception {
		EgovKkuAppSchoolInfoJsoupCrawler soup = new EgovKkuAppSchoolInfoJsoupCrawler();
		String[][] dataList = new String[0][0];
		try {
			driver.get(url);
			Thread.sleep(1000);
			
			
			int boardLength = 1;
			for(int i=1; i==boardLength; i++) {
				try {
					driver.findElement(By.cssSelector("#list_frm > div > table > tbody > tr:nth-child("+i+") > td.ta_left.b_title > a"));
					boardLength++;
				} catch (Exception e) { 
				}
			}
			
			dataList = new String[boardLength-1][7];
			for (int i=1; i<=boardLength; i++) {
				driver.findElement(By.cssSelector("#list_frm > div > table > tbody > tr:nth-child("+i+") > td.ta_left.b_title > a")).click();
				Thread.sleep(1000);
				String currentUrl = driver.getCurrentUrl();

				int startIdx = (currentUrl.indexOf("boardSeq"))+9;
				int endIdx = (currentUrl.indexOf("&id"));
				int index = Integer.parseInt(currentUrl.substring(startIdx,endIdx));
				
				if (IndexList.contains(index)) {
					System.err.println(index+" 이미 있음");
					driver.navigate().back();
					Thread.sleep(1000);
				} else {
					System.err.println(index+" 업데이트 중");
					//게시물 번호
					dataList[i][0] = Integer.toString(index);
					
					//게시물 제목
					dataList[i][1] = driver.findElement(By.cssSelector("#board-container > h4")).getText().substring(5);
					
					//게시물 첨부파일
					Elements files = soup.crawler(currentUrl, "#board-container > div:nth-child(6) > span.detail_info_after");
					dataList[i][2] = String.valueOf(files);
					
					//게시물 내용
					Elements contents = soup.crawler(currentUrl, "#board_contents");
					//이모티콘 제거
					String content = String.valueOf(contents);
					Pattern emoticons = Pattern.compile("[\\uD83C-\\uDBFF\\uDC00-\\uDFFF]+");
					Matcher emoticonsMatcher = emoticons.matcher(content);
					content = emoticonsMatcher.replaceAll("");
					//
					dataList[i][3] = content;
					
					//게시물 날짜
					dataList[i][4] = driver.findElement(By.cssSelector("#board-container > div:nth-child(5) > span:nth-child(2)")).getText();
					
					//게시물 작성자
					dataList[i][5] = driver.findElement(By.cssSelector("#board-container > div:nth-child(5) > span.detail_info_after.noBd")).getText();
					
					//게시판 종류
					dataList[i][6] = driver.findElement(By.cssSelector("#contents > div.contents_left > div.content_title > h3")).getText();
					
					driver.navigate().back();
					Thread.sleep(1000);
				}
			}
		} catch(Exception e) {
		}
		
		quitDriver();
		return dataList;
	}
	

	private void quitDriver() {
		driver.quit();
	}

}
