package egovframework.kku.utl.selenium;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class EgovKkuAppTimetableSeleniumDriver {

	private WebDriver driver;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "/root/Desktop/chromedriver";
//	public static String WEB_DRIVER_PATH = "C:/eGovFrameDev-3.10.0-64bit/webdriver/chromedriver107/chromedriver.exe";

	public EgovKkuAppTimetableSeleniumDriver() {
		chrome();
	}
	
	public void chrome() {
		System.setProperty(WEB_DRIVER_ID,  WEB_DRIVER_PATH);
		
		//webDriver 옵션 설정
		ChromeOptions options = new ChromeOptions();
		options.setHeadless(true);
		options.addArguments("--start-maximized");
//		options.addArguments("--window-size='1280,960'");
		options.addArguments("--lang=ko");
		options.addArguments("--no-sandbox");
		options.addArguments("--disable-dev-shm-usage");
		options.addArguments("--disable-gpu");
		options.setCapability("ignoreProtectedModeSettings",  true);
		
		
		//webDriver 생성
		driver = new ChromeDriver(options);
		driver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
	}
	
	public String useDriver(String url, String id, String pwd) throws Exception {
		driver.get(url);
		
		WebElement inputId = driver.findElement(By.cssSelector("#userid"));
		inputId.click();
		inputId.sendKeys(id);
		
		WebElement inputPwd = driver.findElement(By.cssSelector("#userpwd"));
		inputPwd.click();
		inputPwd.sendKeys(pwd);
		
		WebElement login = driver.findElement(By.cssSelector("#login"));
		login.click();
		
		Thread.sleep(1000);
		if(ExpectedConditions.alertIsPresent().apply(driver)==null) {
		} else {
			driver.switchTo().alert().accept();
		}
		Thread.sleep(1000);		
		WebElement list = driver.findElement(By.cssSelector("#tree_menu > li.closed.expandable.lastExpandable > span"));
		list.click();
		
		String timetable = driver.findElement(By.cssSelector("#tree_menu > li.closed.collapsable.lastCollapsable > ul")).getText();
		Thread.sleep(1000);
		
		quitDriver();
		return timetable;
	}

	private void quitDriver() {
		driver.quit();
	}

}