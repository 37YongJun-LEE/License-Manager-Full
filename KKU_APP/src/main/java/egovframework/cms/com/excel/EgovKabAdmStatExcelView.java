package egovframework.cms.com.excel;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import egovframework.com.cmm.EgovCmsStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class EgovKabAdmStatExcelView extends AbstractExcelView{
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		setDisposition("평가MD통계_다운로드.xls", request, response);
		
		Map<String, Object> resultMap = (Map<String, Object>) model.get("resultMap");
		
		HSSFSheet sheet = createSheet(workbook, 0, "기관별 MD 통계");
		HSSFRow row = null;
		HSSFCell cell = null;
		
		CellStyle headerStyle = creatHeaderStyle(workbook);	    	
		CellStyle groupStyle = creatGroupStyle(workbook);
		CellStyle contentsStyle = creatContentsStyle(workbook);
		CellStyle contentsStyleCenter = creatContentsStyleAlignCenter(workbook);
		
		sheet.setColumnWidth(0, (short)500*20);// 인증기관
	    sheet.setColumnWidth(1, (short)300*20);// 평가팀장 MD
	    sheet.setColumnWidth(2, (short)300*20);// 평가사 MD
	    sheet.setColumnWidth(3, (short)300*20);// 합계
		
		row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("인증기관");
		cell = row.createCell(1);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("평가팀장 MD");
		cell = row.createCell(2);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("평가사 MD");
		cell = row.createCell(3);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("합계");
		
		List<EgovMap> orgResultList = (List<EgovMap>) resultMap.get("orgResultList");
		
		for(int i = 0; i < orgResultList.size(); i++){
			
			EgovMap result = orgResultList.get(i);
			
			String leaderMdStr = EgovCmsStringUtil.isNullToString(result.get("leaderMd"));
			if("".equals(leaderMdStr)) leaderMdStr = "0.0";
			float leaderMd = Float.parseFloat(leaderMdStr);
			
			String othersMdStr = EgovCmsStringUtil.isNullToString(result.get("othersMd"));
			if("".equals(othersMdStr)) othersMdStr = "0.0";
			float othersMd = Float.parseFloat(othersMdStr);
			
			row = sheet.createRow(i + 1);
			cell = row.createCell(0);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(EgovCmsStringUtil.isNullToString(result.get("orgNmKr")));
			cell = row.createCell(1);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(leaderMd);
			cell = row.createCell(2);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(othersMd);
			cell = row.createCell(3);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(leaderMd + othersMd);
		}
		
		sheet = createSheet(workbook, 1, "평가사별 MD 통계");
		sheet.setColumnWidth(0, (short)300*20);// 평가사
	    sheet.setColumnWidth(1, (short)300*20);// 평가팀장 MD
	    sheet.setColumnWidth(2, (short)300*20);// 평가사 MD
	    sheet.setColumnWidth(3, (short)300*20);// 기술전문가 MD
	    sheet.setColumnWidth(4, (short)300*20);// 참관 MD

	    
	    row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("구분");
		cell = row.createCell(1);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("평가팀장 MD");
		cell = row.createCell(2);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("평가사 MD");
		cell = row.createCell(3);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("기술전문가 MD");
		cell = row.createCell(4);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("참관 MD");

		
		List<EgovMap> usrResultList = (List<EgovMap>) resultMap.get("usrResultList");
		double totU1Md = 0.0;
		double totU2Md = 0.0;
		double totU3Md = 0.0;
		double totU4Md = 0.0;
		
		for(int i = 0; i < usrResultList.size(); i++){
			
			EgovMap result = usrResultList.get(i);
			
			String u1MdStr = EgovCmsStringUtil.isNullToString(result.get("u1Md"));
			if("".equals(u1MdStr)) u1MdStr = "0.0";
			float u1Md = Float.parseFloat(u1MdStr);
			
			String u2MdStr = EgovCmsStringUtil.isNullToString(result.get("u2Md"));
			if("".equals(u2MdStr)) u2MdStr = "0.0";
			float u2Md = Float.parseFloat(u2MdStr);
			
			String u3MdStr = EgovCmsStringUtil.isNullToString(result.get("u3Md"));
			if("".equals(u3MdStr)) u3MdStr = "0.0";
			float u3Md = Float.parseFloat(u3MdStr);
			
			String u4MdStr = EgovCmsStringUtil.isNullToString(result.get("u4Md"));
			if("".equals(u4MdStr)) u4MdStr = "0.0";
			float u4Md = Float.parseFloat(u4MdStr);
			
			row = sheet.createRow(i + 1);
			cell = row.createCell(0);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(EgovCmsStringUtil.isNullToString(result.get("usrNmKr")));
			cell = row.createCell(1);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(u1Md);
			totU1Md = totU1Md + u1Md;
			cell = row.createCell(2);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(u2Md);
			totU2Md = totU2Md + u2Md;
			cell = row.createCell(3);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(u3Md);
			totU3Md = totU3Md + u3Md;
			cell = row.createCell(4);
			cell.setCellStyle(contentsStyleCenter);
			cell.setCellValue(u4Md);
			totU4Md = totU4Md + u4Md;
		}
		
		if(usrResultList.size() > 0){
			row = sheet.createRow(usrResultList.size()+1);
			cell = row.createCell(0);
			cell.setCellStyle(headerStyle);
			cell.setCellValue("합계");
			cell = row.createCell(1);
			cell.setCellStyle(headerStyle);
			cell.setCellValue(totU1Md);
			cell = row.createCell(2);
			cell.setCellStyle(headerStyle);
			cell.setCellValue(totU2Md);
			cell = row.createCell(3);
			cell.setCellStyle(headerStyle);
			cell.setCellValue(totU3Md);
			cell = row.createCell(4);
			cell.setCellStyle(headerStyle);
			cell.setCellValue(totU4Md);
		}
	}
	
	/**
	 * 브라우저 구분 얻기
	 * @param request
	 * @return
	 */
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
	
	private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String browser = getBrowser(request);
		
		String dispositionPrifix = "atachment; filename=";
		String encodedFilename = null;
		
		if(browser.equals("MSIE")){
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")){
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if ( browser.equals("Firefox")){
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if ( browser.equals("Opera")){
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")){
			StringBuffer sb = new StringBuffer();
			for(int i=0; i< filename.length(); i++){
				char c = filename.charAt(i);
				if(c > '~'){
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else { 
			throw new IOException("Not supported browser");
		}
		
		response.setHeader("Content-Disposition", dispositionPrifix + encodedFilename); 
		
		if("Opera".equals(browser)){
			response.setContentType("application/octet-stream;charser=UTF-8");
		}
	}
	
	
	private HSSFSheet createSheet(HSSFWorkbook workbook, int sheetIndex, String sheetName){
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(sheetIndex, sheetName);
		sheetIndex++;
		return sheet;
	}
	
	/**
     * 헤더 스타일 생성
     */	      
    private CellStyle creatHeaderStyle(HSSFWorkbook workbook) 
    {
    	//헤더 스타일 생성
        CellStyle style = workbook.createCellStyle();
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        style.setAlignment(HSSFCellStyle.ALIGN_LEFT);

        //폰트 설정
	    Font font = workbook.createFont();
	    font.setFontName("나눔고딕"); //글씨체
	    font.setFontHeight((short)(13*20)); //사이즈
	    font.setBoldweight(Font.BOLDWEIGHT_BOLD); //볼드 (굵게)
	    style.setFont(font);
	    
	    //가운데 정렬
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        
        //가운데 맞춤
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        
        //상단 테두리
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        
        //하단 테두리 
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        
        //좌측테두리
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        
        //우측테두리
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());    	

        return style;
    }    
    
    /**
     * 그룹 스타일 생성
     */	      
    private CellStyle creatGroupStyle(HSSFWorkbook workbook)
    {
    	//그룹 스타일 생성
    	CellStyle style = workbook.createCellStyle();
    	
    	//폰트 설정
	    Font font = workbook.createFont();
	    font.setFontName("나눔고딕"); //글씨체
	    font.setFontHeight((short)(11*20)); //사이즈
	    style.setFont(font);
	    
    	style.setFillPattern(CellStyle.SOLID_FOREGROUND);
    	style.setFillForegroundColor(IndexedColors.LIGHT_CORNFLOWER_BLUE.getIndex());
    	style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    	
    	//상단 테두리
    	style.setBorderTop(HSSFCellStyle.BORDER_THIN);
    	style.setTopBorderColor(IndexedColors.BLACK.getIndex());
    	
    	//하단 테두리
    	style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    	style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
    	
    	//좌측테두리
    	style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    	style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
    	
    	//우측테두리
    	style.setBorderRight(HSSFCellStyle.BORDER_THIN);
    	style.setRightBorderColor(IndexedColors.BLACK.getIndex());    	
    	
    	return style;
    }    
    
	 /**
     * 컨텐츠 스타일 생성
     */	      
    private CellStyle creatContentsStyle(HSSFWorkbook workbook) 
    {
    	//내용영역 스타일 생성
        CellStyle style = workbook.createCellStyle();
        
	    //폰트 설정
	    Font font = workbook.createFont();
	    font.setFontName("나눔고딕"); //글씨체
	    font.setFontHeight((short)(11*20)); //사이즈
	    style.setFont(font);
	    
        //가운데 맞춤
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        
        //가운데 정렬
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        
        //상단 테두리
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        
        //하단 테두리 
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        
        //좌측테두리
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        
        //우측테두리
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());    

        return style;
    }        
    
	 /**
     * 컨텐츠 스타일 생성
     */	      
    private CellStyle creatContentsStyleAlignCenter(HSSFWorkbook workbook) 
    {
    	//내용영역 스타일 생성
        CellStyle style = workbook.createCellStyle();
        
        //폰트 설정
	    Font font = workbook.createFont();
	    font.setFontName("나눔고딕"); //글씨체
	    font.setFontHeight((short)(11*20)); //사이즈
	    style.setFont(font);
        
        //가운데 정렬
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        
        //가운데 맞춤
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        
        //상단 테두리
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        
        //하단 테두리 
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        
        //좌측테두리
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        
        //우측테두리
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());    

        return style;
    }  
    /**
     * 컨텐츠 스타일 생성
     */	      
    private CellStyle creatContentsStyleNewLine(HSSFWorkbook workbook) 
    {
    	//내용영역 스타일 생성
        CellStyle style = workbook.createCellStyle();
        
        //폰트 설정
	    Font font = workbook.createFont();
	    font.setFontName("나눔고딕"); //글씨체
	    font.setFontHeight((short)(11*20)); //사이즈
	    style.setFont(font);
	    
        //줄 바꿈
        style.setWrapText(true);
        
        //상단 테두리
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        
        //하단 테두리 
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        
        //좌측테두리
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        
        //우측테두리
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());    

        return style;
    }  

}
