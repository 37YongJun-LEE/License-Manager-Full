package egovframework.kku.utl.selenium;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.remote.SessionId;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class EgovKkuAppLibSeleniumDriver {

	private WebDriver driver;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "/root/chromedriver";

	public EgovKkuAppLibSeleniumDriver() {
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
		//options.addArguments("headless");

		options.setCapability("ignoreProtectedModeSettings",  true);
		
		
		//webDriver 생성
		driver = new ChromeDriver(options);
		driver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
	}
	
	public String useDriver(String url, String id, String pwd) throws Exception {
	
		driver.get(url);
		//상단 메뉴바 클릭
		WebElement menubar = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div.ikc-header-wrap > div > div.ikc-header > div.ikc-gnb-wrap.ikc-gnb-show > a.ikc-btn-gnb"));
		menubar.click();
		Thread.sleep(1000);
		//이용자 서비스 클릭
		WebElement tmenubar = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div:nth-child(5) > div > div.ikc-overview > ul.kkug-gnb-menu.visible-sm.visible-xs > li:nth-child(4)"));
		tmenubar.click();
//		시설물 및 기타서비스이용 클릭
		WebElement ttmenubar = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div:nth-child(5) > div > div.ikc-overview > ul.kkug-menu-wrap > li.ikc-active > ul > li:nth-child(3)"));
		ttmenubar.click();

		String menuList = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div:nth-child(5) > div > div.ikc-overview > ul.kkug-menu-wrap > li.ikc-active > ul > li.ikc-active")).getText();
//		열람실 현황 클릭
		WebElement tttmenubar = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div:nth-child(5) > div > div.ikc-overview > ul.kkug-menu-wrap > li.ikc-active > ul > li.ikc-active > ul > li:nth-child(3) > a"));
		tttmenubar.click();
		
		
		/*Thread.sleep(1000);
		String List = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div:nth-child(5) > div > div.ikc-overview > ul.kkug-menu-wrap > li:nth-child(5) > ul > li:nth-child(3) > strong")).getText();
		*/
		
		Thread.sleep(1000);
		WebElement inputId = driver.findElement(By.cssSelector("#userid"));
		inputId.click();
		inputId.sendKeys(id);
		
		WebElement inputPwd = driver.findElement(By.cssSelector("#password"));
		inputPwd.click();
		inputPwd.sendKeys(pwd);
		//body > div.ikc-pyxis-wrap > div.ikc-container-wrap > div.ikc-container > div > div > div.ikc-service-form.ikc-loginwrap > form > div.ikc-btnswrap > button
		WebElement login = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div.ikc-container-wrap > div.ikc-container > div > div > div.ikc-service-form.ikc-loginwrap > form > div.ikc-btnswrap > button"));
		login.click();
		Thread.sleep(2000);
		//열람실 현황 테이블
		WebElement table = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div.ikc-container-wrap > div.ikc-container > div > div.ikc-main"));
		String test = table.getAttribute("innerHTML");
		
		String returnUrl = driver.getCurrentUrl();
		SessionId s = ((RemoteWebDriver) driver).getSessionId();

		if(ExpectedConditions.alertIsPresent().apply(driver)==null) {
			quitDriver();
			return test;
			
		} else {
			
			driver.switchTo().alert().accept();
			return "none";
		}
		
		/*WebElement list = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div.ikc-header-wrap > div > div.ikc-header > div.ikc-gnb-wrap.ikc-gnb-show > a.ikc-btn-gnb"));
		list.click();*/
		/*WebElement Secondslist = driver.findElement(By.cssSelector("body > div.ikc-pyxis-wrap > div.ikc-header-wrap > div > div.ikc-header > div.ikc-gnb-wrap.ikc-gnb-show > div > ul > li:nth-child(4) > div > ul > li:nth-child(3) > ul > li:nth-child(3) > a"));
		Secondslist.click();
		*/
		/*String timetable = driver.findElement(By.cssSelector("#tree_menu > li.closed.collapsable.lastCollapsable > ul")).getText();
		Thread.sleep(1000);
		*/
		
		//String test = list.toString();
//		List<String> dataList = Arrays.asList(timetable.split("\n"));
//		
		
		
	}

	private void quitDriver() {
		driver.quit();
	}

}