package egovframework.cms.com.excel;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.springframework.web.servlet.view.AbstractView;
import org.springframework.web.servlet.view.document.AbstractExcelView;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.CsvMapWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.io.ICsvMapWriter;
import org.supercsv.prefs.CsvPreference;

import egovframework.com.cmm.EgovCmsStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class EgovKpcUserHpListExcelView extends AbstractView {
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String browser = getBrowser(request);
		
		String dispositionPrifix = "atachment; filename=";
		String encodedFilename = null;
		String filename = "전화번호부.csv";
		
		if(browser.equals("MSIE")){
			encodedFilename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")){
			encodedFilename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
		} else if ( browser.equals("Firefox")){
			encodedFilename = "\"" + new String(filename.getBytes("utf-8"), "8859_1") + "\"";
		} else if ( browser.equals("Opera")){
			encodedFilename = "\"" + new String(filename.getBytes("utf-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")){
			StringBuffer sb = new StringBuffer();
			for(int i=0; i< filename.length(); i++){
				char c = filename.charAt(i);
				if(c > '~'){
					sb.append(URLEncoder.encode("" + c, "utf-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else { 
			throw new IOException("Not supported browser");
		}
		
		
		response.setContentType("text/csv; charset=MS949");
		response.setHeader("Content-Disposition", dispositionPrifix + encodedFilename); 
        
        excelDataPurification(model, request, response);
        
	}  
	
	protected void excelDataPurification(Map<String, Object> modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Map 을 사용한다면 CsvMapWriter 사용
        ICsvMapWriter csvMapWriter = new CsvMapWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
 
        // VO 를 사용한다면 CsvBeanWriter 사용
        //ICsvBeanWriter csvBeanWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
       
        Map<String, Object> result = (Map<String, Object>) modelMap.get("resultMap");
		List<EgovMap> resultCompList = (List<EgovMap>) result.get("resultList");
        
        
        
        String columnIds = "usrName,usrId,orgNm,usrPstNm";
        String columnNames = "Given Name,Phone 1 - Value,Organization 1 - Name,Organization 1 - Title";
 
        String[] colids = columnIds.split(",");
        String[] colnms = columnNames.split(",");
       
        
 
        csvMapWriter.writeHeader(colnms);
 
        if (resultCompList.size()>0) {
            for (int i = 0; i < resultCompList.size(); i++) {
                Map<String, Object> rowData = (Map<String, Object>) resultCompList.get(i);
                csvMapWriter.write(rowData, colids);
            }
        }
        csvMapWriter.close();
    }
	
	private String getBrowser(HttpServletRequest request){
		String header = request.getHeader("User-Agent");
		if(header.indexOf("MSIE")>-1){
			return "MSIE";
		} else if (header.indexOf("Chrome") > -1){
			return "Chrome";
		} else if (header.indexOf("Opera") > -1){
			return "Opera";
		} else if (header.indexOf("Trident") > -1){
			return "Trident";
		} 	return "Firefox";
	}
}
