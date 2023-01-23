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

import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerService;
import egovframework.kku.usr.service.EgovKkuAppSchoolInfoCrawlerVO;

//모시래학사 학식정보 크롤러
public class EgovKkuAppTestSeleniumDriver {

	private WebDriver driver;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "/root/chromedriver";

	public EgovKkuAppTestSeleniumDriver() {
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
	
	public String[][] useDriver(String url) throws Exception {

		driver.get(url);
		
		WebElement id = driver.findElement(By.xpath("/html/body/div[2]/div[1]/div/div/div[2]/div/div[1]/input"));
		System.err.println("id:"+id);
		id.click();
		id.sendKeys("crazy012");
		
		
		quitDriver();
		return null;
	}
	

	private void quitDriver() {
		driver.quit();
	}

}
