package egovframework.com.utl.jsoup;

import java.io.IOException;
import org.springframework.stereotype.Component;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

@Component
public class EgovKkuAppSchoolInfoJsoupCrawler {

   // 웹 크롤러, url=주소, sel=css태그
   public static Elements crawler(String url, String sel) throws IOException {
      Document doc = Jsoup.connect(url).get();
      
      Elements ele = doc.select(sel);
      
      return ele;
   }

}
