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

public class EgovKpcCmntUsrListExcelView extends AbstractExcelView{
	
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook,
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		//데이터 
		Map<String, Object> result = (Map<String, Object>) model.get("resultMap");
		String totalCnt = (String) result.get("resultCnt");
		@SuppressWarnings("unchecked")
		List<EgovMap> resultCompList = (List<EgovMap>) result.get("resultList");
		
		String resultType = (String) result.get("resultType");
		
		if(resultType.equals("C1")){
			setDisposition(resultCompList.get(0).get("cmntLoc")+"_회원목록.xls", request, response);
		}else{
			setDisposition(resultCompList.get(0).get("cmntLoc")+"_"+resultCompList.get(0).get("cmntSubNm")+"_회원목록.xls", request, response);
		}
		
		
		HSSFSheet sheet = createFirstSheet(workbook);
		HSSFRow row = null;
				
		CellStyle headsStyle = creatHeadStyle(workbook);	    	
		CellStyle groupStyle = creatGroupStyle(workbook);
		CellStyle contentsStyle = creatContentsStyle(workbook);
		CellStyle contentsStyleCenter = creatContentsStyleAlignCenter(workbook);		    
	   
	    
	    //컬럼 크기 셋팅
	    sheet.setColumnWidth(0, (short)150*20);//순번
	    sheet.setColumnWidth(1, (short)150*20);//지역
	    sheet.setColumnWidth(2, (short)150*20);//기수
	    sheet.setColumnWidth(3, (short)300*20);//직책
	    sheet.setColumnWidth(4, (short)200*20);//회원명
	    sheet.setColumnWidth(5, (short)200*20);//기업직책
	    sheet.setColumnWidth(6, (short)400*20);//휴대전화
	    sheet.setColumnWidth(7, (short)500*20);//기업
	    sheet.setColumnWidth(8, (short)400*20);//앱설치일
	    sheet.setColumnWidth(9, (short)400*20);//최근접속일
	    sheet.setColumnWidth(10, (short)400*20);//정보변경일
	    
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
	    row.createCell(3).setCellValue("구분");
	    row.createCell(4).setCellValue("회원명");
	    row.createCell(5).setCellValue("직책");
	    row.createCell(6).setCellValue("휴대전화");
	    row.createCell(7).setCellValue("기업");
	    row.createCell(8).setCellValue("앱설치일");
	    row.createCell(9).setCellValue("최근접속일");
	    row.createCell(10).setCellValue("정보수정일");
	    
	    //스타일 지정
	    for(int i=0 ;i<11;i++){
	    	getCell(sheet, 1, i).setCellStyle(creatHeadStyle(workbook));
	    }
	}
	
	private void setSource(HSSFSheet sheet, HSSFRow row, List<EgovMap> list, HSSFWorkbook workbook){
		CellStyle headsStyle = creatHeadStyle(workbook);	    	
		CellStyle groupStyle = creatGroupStyle(workbook);
		CellStyle contentsStyle = creatContentsStyle(workbook);
		CellStyle contentsStyleCenter = creatContentsStyleAlignCenter(workbook);
		CellStyle contentsStyleNewLine = creatContentsStyleNewLine(workbook);
		
		
		for(int i=0; i<list.size(); i++){
			String no = EgovCmsStringUtil.isNullToString(i+1);
			String cmntLoc = EgovCmsStringUtil.isNullToString(list.get(i).get("cmntLoc"));
			String cmntSubNm = EgovCmsStringUtil.isNullToString(list.get(i).get("cmntSubNm"));
			String usrName = EgovCmsStringUtil.isNullToString(list.get(i).get("usrName"));
			String usrId = EgovCmsStringUtil.isNullToString(list.get(i).get("usrId"));
			String usrPstNm = EgovCmsStringUtil.isNullToString(list.get(i).get("usrPstNm"));
			String usrPst = EgovCmsStringUtil.isNullToString(list.get(i).get("usrPst"));
			String orgNm = EgovCmsStringUtil.isNullToString(list.get(i).get("orgNm"));
			
			String usrAppDate = EgovCmsStringUtil.isNullToString(list.get(i).get("usrAppDate"));
			if(!usrAppDate.equals("")){
				usrAppDate = usrAppDate.substring(0,10);
			}
			String loginDate = EgovCmsStringUtil.isNullToString(list.get(i).get("loginDate"));
			if(!loginDate.equals("")){
				loginDate = loginDate.substring(0,10);
			}
			String modDate = EgovCmsStringUtil.isNullToString(list.get(i).get("modDate"));
			if(!modDate.equals("")){
				modDate = modDate.substring(0,10);
			}
			
			
			
			row = sheet.createRow(2+i);
			row.createCell(0).setCellValue(no); 
			row.createCell(1).setCellValue(cmntLoc);
			row.createCell(2).setCellValue(cmntSubNm);
		    row.createCell(3).setCellValue(usrPstNm);
		    row.createCell(4).setCellValue(usrName);
		    row.createCell(5).setCellValue(usrPst);
		    row.createCell(6).setCellValue(usrId);
		    row.createCell(7).setCellValue(orgNm);
		    row.createCell(8).setCellValue(usrAppDate);
		    row.createCell(9).setCellValue(loginDate);
		    row.createCell(10).setCellValue(modDate);
		    
		    
		    //스타일 지정
		    for(int j=0; j<11; j++){
		    	 getCell(sheet, 2+i, j).setCellStyle(contentsStyleCenter);
		    }
		    getCell(sheet, 2+i, 2).setCellStyle(contentsStyleNewLine);
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
