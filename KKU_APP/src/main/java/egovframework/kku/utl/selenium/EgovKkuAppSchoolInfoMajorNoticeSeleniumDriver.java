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
import com.vdurmont.emoji.EmojiParser;


public class EgovKkuAppSchoolInfoMajorNoticeSeleniumDriver {

	private WebDriver driver;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "/root/Desktop/chromedriver";
//	public static String WEB_DRIVER_PATH = "C:/eGovFrameDev-3.10.0-64bit/webdriver/chromedriver107/chromedriver.exe";

	public EgovKkuAppSchoolInfoMajorNoticeSeleniumDriver() {
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
	
	//default
	public String[][] useDriver(String url, List<Integer> IndexList) throws Exception {
		String[][] dataList = new String[30][6];
		
		try {
			driver.get(url);
			Thread.sleep(1000);
			
			//로그인 필요 시 로그인
			try {
				System.err.println("try login");
				WebElement id = driver.findElement(By.cssSelector("#id"));
				id.click();
				id.sendKeys("crazy012");
				
				WebElement pwd = driver.findElement(By.cssSelector("#password"));
				pwd.click();
				pwd.sendKeys("alcls123!");
				
				driver.findElement(By.cssSelector("#fm > fieldset > div > input")).click();
				Thread.sleep(1000);
				
			} catch(Exception e) {
				System.err.println("login catch");
			}
			
			int lastIndex = 0;
			try {
				for (int i=1; i<15; i++) {
					System.err.println("for "+i);
					driver.findElement(By.cssSelector("#noticeList > tr:nth-child("+i+") > td.subject > a")).click();
					Thread.sleep(1000);
					String currentUrl = driver.getCurrentUrl();
	
					int startIdx = (currentUrl.indexOf("seq="))+4;
					int index = Integer.parseInt(currentUrl.substring(startIdx));
					
					if(IndexList.isEmpty() || IndexList.contains(index)==false) {
						
						//게시물 번호
						dataList[i-1][0] = Integer.toString(index);
						
						//게시물 제목 
						dataList[i-1][1] = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > table > tbody > tr:nth-child(1) > td.subject")).getText();
						
						//게시물 첨부파일
						try {
							dataList[i-1][2] = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > table > tbody > tr:nth-child(3) > td > div > div")).getAttribute("outerHTML");
						} catch(Exception e) {
						}
						
						//게시물 내용
						String content = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > div")).getAttribute("outerHTML");
						dataList[i-1][3] = EmojiParser.removeAllEmojis(content);
						
						//게시물 날짜
						dataList[i-1][4] = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > table > tbody > tr:nth-child(2) > td:nth-child(4)")).getText();
						
						//게시물 작성자
						dataList[i-1][5] = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > table > tbody > tr:nth-child(2) > td:nth-child(2)")).getText();
						
						driver.navigate().back();
						Thread.sleep(1000);
						
						lastIndex = i;
					} else if (IndexList.contains(index)) {
						driver.navigate().back();
						Thread.sleep(1000);
					}
				}
			} catch(Exception e) {
			}
			
			try {
				for (int i=1; i<15; i++) {
					System.err.println("for2 "+i);
					driver.findElement(By.cssSelector("#dispList > tr:nth-child("+i+") > td.subject > a")).click();
					Thread.sleep(1000);
					String currentUrl = driver.getCurrentUrl();
	
					int startIdx = (currentUrl.indexOf("seq="))+4;
					int index = Integer.parseInt(currentUrl.substring(startIdx));
					
					if(IndexList.isEmpty() || IndexList.contains(index)==false) {
						
						//게시물 번호
						dataList[lastIndex+i][0] = Integer.toString(index);
						
						//게시물 제목 
						dataList[lastIndex+i][1] = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > table > tbody > tr:nth-child(1) > td.subject")).getText();
						
						//게시물 첨부파일
						try {
							dataList[lastIndex+i][2] = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > table > tbody > tr:nth-child(3) > td > div > div")).getAttribute("outerHTML");
						} catch(Exception e) {
						}
						
						//게시물 내용
						String content = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > div")).getAttribute("outerHTML");
						dataList[lastIndex+i][3] = EmojiParser.removeAllEmojis(content);
						
						//게시물 날짜
						dataList[lastIndex+i][4] = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > table > tbody > tr:nth-child(2) > td:nth-child(4)")).getText();
						
						//게시물 작성자
						dataList[lastIndex+i][5] = driver.findElement(By.cssSelector("#container > div > div > div.column_body > div.cont_section.pt20 > div > div > div.post_tbl.board > div > table > tbody > tr:nth-child(2) > td:nth-child(2)")).getText();
						
						driver.navigate().back();
						Thread.sleep(1000);
						
					} else if (IndexList.contains(index)) {
						driver.navigate().back();
						Thread.sleep(1000);
					}
				}
			} catch(Exception e) {
			}
		} catch(Exception e) {
		}
		
		quitDriver();
		return dataList;
	}
	
	//컴퓨터공학과
	public String[][] useDriverCS(String url, List<Integer> IndexList) throws Exception {
		String[][] dataList = new String[30][6];
		try {
			driver.get(url);
			Thread.sleep(1000);
			
			try {
				for (int i=1; i<30; i++) {
					driver.findElement(By.cssSelector("#bbslist > table > tbody > tr:nth-child("+i+") > td.sbj > a")).click();
					
					String currentUrl = driver.getCurrentUrl();
					
					int startIdx = currentUrl.indexOf("uid=")+4;
					int index = Integer.parseInt(currentUrl.substring(startIdx));
					
					if(IndexList.isEmpty() || IndexList.contains(index) == false) {
						
						//게시물 번호
						dataList[i-1][0] = Integer.toString(index);
						
						//게시물 제목
						dataList[i-1][1] = driver.findElement(By.cssSelector("#bbsview > div.viewbox > div.subject > h1")).getText();
						
						//게시물 내용(첨부파일 포함)
						String content = driver.findElement(By.cssSelector("#vContent")).getAttribute("outerHTML");
						content = content.replace("snsbox\">", "snsbox\"><!--");
						content += "--></div></div>";
						dataList[i-1][3] = content;
						
						//게시물 날짜
						String info = driver.findElement(By.cssSelector("#bbsview > div.viewbox > div.info > div.xleft")).getText();
						
						List<String> infoList = Arrays.asList(info.split(" | "));
						
						//게시물 날짜
						dataList[i-1][4] = infoList.get(2);
								
						//게시물 작성자
						dataList[i-1][5] = infoList.get(0);
						
						driver.navigate().back();
						Thread.sleep(1000);
					} else {
						driver.navigate().back();
						Thread.sleep(1000);
					}
				}
			} catch(Exception e) {
			}
		} catch(Exception e) {
		}
		
		quitDriver();
		return dataList;
	}
	
	//의과대학
	public String[][] useDriverMed(String url, List<Integer> IndexList) throws Exception {
		String[][] dataList = new String[30][6];
		try {
			driver.get(url);
			Thread.sleep(1000);
			
			try {
				for (int i=1, j=0; i<61; i+=3,j++) {
					driver.findElement(By.cssSelector("body > div.wrapper > div > div.basic-body.container > div > div.basic-body-main.right-main.col-md-9 > div.basic-body-main.col-md-12 > div.board-list > div.sky-form > div > div > table > tbody > tr:nth-child("+i+") > td.td-width > div > a")).click();
					
					String currentUrl = driver.getCurrentUrl();
					
					int startIdx = 0;
					int index = 0;
					if(currentUrl.contains("&seq=")) {
						startIdx = currentUrl.indexOf("&seq=")+5;
						index = Integer.parseInt(currentUrl.substring(startIdx));
						
						if(IndexList.isEmpty() || IndexList.contains(index) == false) {
							
							//게시물 번호
							dataList[j][0] = Integer.toString(index);
							
							//게시물 제목
							dataList[j][1] = driver.findElement(By.cssSelector("body > div.wrapper > div > div.basic-body.container > div > div.basic-body-main.right-main.col-md-9 > div.basic-body-main.col-md-12 > article > h4 > strong")).getText();
							
							//게시물 첨부파일
							try {
								dataList[j][2] = driver.findElement(By.cssSelector("body > div.wrapper > div > div.basic-body.container > div > div.basic-body-main.right-main.col-md-9 > div.basic-body-main.col-md-12 > article > section.board-view-file > ul")).getAttribute("outerHTML");
							} catch(Exception e) {
							}
							
							//게시물 내용
							dataList[j][3] = driver.findElement(By.cssSelector("body > div.wrapper > div > div.basic-body.container > div > div.basic-body-main.right-main.col-md-9 > div.basic-body-main.col-md-12 > article > section.board-view-atc")).getAttribute("outerHTML");
							
							//게시물 날짜
							dataList[j][4] = driver.findElement(By.cssSelector("body > div.wrapper > div > div.basic-body.container > div > div.basic-body-main.right-main.col-md-9 > div.basic-body-main.col-md-12 > article > section.board-view-info > div.pull-right.text-right > span:nth-child(2)")).getText();

							//게시물 작성자
							dataList[j][5] = driver.findElement(By.cssSelector("body > div.wrapper > div > div.basic-body.container > div > div.basic-body-main.right-main.col-md-9 > div.basic-body-main.col-md-12 > article > section.board-view-info > div.pull-left > span.view-nick > span > a")).getText();

							driver.navigate().back();
							Thread.sleep(1000);
						} else {
							driver.navigate().back();
							Thread.sleep(1000);
						}
					} else {
						
					}
				}
			} catch(Exception e) {
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
