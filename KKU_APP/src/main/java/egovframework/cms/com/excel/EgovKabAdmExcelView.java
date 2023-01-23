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
import org.springframework.web.servlet.view.document.AbstractExcelView;

import egovframework.com.cmm.EgovCmsStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class EgovKabAdmExcelView extends AbstractExcelView{
	
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook,
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		setDisposition("회원목록.xls", request, response);
		
		HSSFSheet sheet = createFirstSheet(workbook);
		HSSFRow row = null;
				
		CellStyle headsStyle = creatHeadStyle(workbook);	    	
		CellStyle groupStyle = creatGroupStyle(workbook);
		CellStyle contentsStyle = creatContentsStyle(workbook);
		CellStyle contentsStyleCenter = creatContentsStyleAlignCenter(workbook);		    
	    
	    //데이터 
	    Map<String, Object> result = (Map<String, Object>) model.get("resultMap");
	    String totalCnt = (String) result.get("resultCnt");
	    @SuppressWarnings("unchecked")
		List<EgovMap> resultCompList = (List<EgovMap>) result.get("resultList");
	    
	    //컬럼 크기 셋팅
	    sheet.setColumnWidth(0, (short)200*20);//순번
	    sheet.setColumnWidth(1, (short)200*20);//지역
	    sheet.setColumnWidth(2, (short)200*20);//기수
	    sheet.setColumnWidth(3, (short)200*20);//직책
	    sheet.setColumnWidth(4, (short)200*20);//회원명
	    sheet.setColumnWidth(5, (short)200*20);//휴대전화
	    sheet.setColumnWidth(6, (short)200*20);//기업
	    sheet.setColumnWidth(7, (short)200*20);//앱설치일
	    sheet.setColumnWidth(8, (short)200*20);//최근접속일
	    sheet.setColumnWidth(9, (short)200*20);//정보변경일
	    
	    //총검색수
	    setTotalCnt(sheet,row,totalCnt, workbook);
	    //컬럼명
	    setTitle(sheet,row, workbook);
	    //내용
	    setSource(sheet,row, resultCompList, workbook);
	    
	}
	
	//총 검색수 
	private void setTotalCnt(HSSFSheet sheet, HSSFRow row, String cnt, HSSFWorkbook workbook){
		row = sheet.createRow(0);
	    row.createCell(0).setCellValue("총 회원수");
	    row.createCell(1).setCellValue(cnt);
	    
	    //스타일 지정
	    getCell(sheet, 0, 0).setCellStyle(creatHeadStyle(workbook));
	    getCell(sheet, 0, 1).setCellStyle(creatContentsStyleAlignCenter(workbook));
	}
	
	private void setTitle(HSSFSheet sheet, HSSFRow row, HSSFWorkbook workbook){
		row = sheet.createRow(1);
	    row.createCell(0).setCellValue("순번");
	    row.createCell(1).setCellValue("지역");
	    row.createCell(2).setCellValue("기수");
	    row.createCell(3).setCellValue("직책");
	    row.createCell(4).setCellValue("회원명");
	    row.createCell(5).setCellValue("휴대전화");
	    row.createCell(6).setCellValue("기업");
	    row.createCell(7).setCellValue("앱설치여부");
	    row.createCell(8).setCellValue("최근접속일");
	    row.createCell(9).setCellValue("정보수정일");
	    
	    //스타일 지정
	    for(int i=0 ;i<9;i++){
	    	getCell(sheet, 1, i).setCellStyle(creatHeadStyle(workbook));
	    }
	}
	
	private void setSource(HSSFSheet sheet, HSSFRow row, List<EgovMap> list, HSSFWorkbook workbook){
		
		for(int i=0; i<list.size(); i++){
			String orgNo = EgovCmsStringUtil.isNullToString(i+1);
			String orgNmKr = EgovCmsStringUtil.isNullToString(list.get(i).get("orgNmKr"));
			String scheme = EgovCmsStringUtil.isNullToString(list.get(i).get("scheme"));
			String ceoNm = EgovCmsStringUtil.isNullToString(list.get(i).get("ceoNm"));
			String adrKr = EgovCmsStringUtil.isNullToString(list.get(i).get("adrKr"));
			String personNm = EgovCmsStringUtil.isNullToString(list.get(i).get("personNm"));
			String telNo = EgovCmsStringUtil.isNullToString(list.get(i).get("telNo"));
			String personEmail = EgovCmsStringUtil.isNullToString(list.get(i).get("personEmail"));
			String faxNo = EgovCmsStringUtil.isNullToString(list.get(i).get("faxNo"));
			 
			row = sheet.createRow(2+i);
			row.createCell(0).setCellValue(orgNo);
			row.createCell(1).setCellValue(orgNmKr);
			row.createCell(2).setCellValue(scheme);
		    row.createCell(3).setCellValue(ceoNm);
		    row.createCell(4).setCellValue(adrKr);
		    row.createCell(5).setCellValue(personNm);
		    row.createCell(6).setCellValue(telNo);
		    row.createCell(7).setCellValue(personEmail);
		    row.createCell(8).setCellValue(faxNo);
		    
		    
		    //스타일 지정
		    for(int j=0; j<9; j++){
		    	 getCell(sheet, 2+i, j).setCellStyle(creatContentsStyleAlignCenter(workbook));
		    }
		    getCell(sheet, 2+i, 2).setCellStyle(creatContentsStyleNewLine(workbook));
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
	
	
	private HSSFSheet createFirstSheet(HSSFWorkbook workbook){
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "회원목록");
		return sheet;
	}
	
	/**
     * 헤더 스타일 생성
     */	      
    private CellStyle creatHeadStyle(HSSFWorkbook workbook) 
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
