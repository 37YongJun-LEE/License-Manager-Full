package egovframework.com.cmm.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.EgovProperties;


/**
 * @Class Name : EgovImageProcessController.java
 * @Description :
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 4. 2.     이삼섭
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 4. 2.
 * @version
 * @see
 *
 */
@SuppressWarnings("serial")
@Controller
public class EgovImageProcessController extends HttpServlet {
    /**
     * 첨부된 이미지에 대한 미리보기 기능을 제공한다.
     *
     * @param atchFileId
     * @param fileSn
     * @param sessionVO
     * @param model
     * @param response
     * @throws Exception
     */
    @RequestMapping("/smartEditorImagePreview.do")
    public void smartEditorImagePreview(Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fileSn = request.getParameter("fileSn");
		
		// 2011.10.10 보안점검 후속조치
		File file = null;
		FileInputStream fis = null;
	
		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;

		try {
		    file = new File(EgovProperties.getProperty("Globals.fileStorePath"), fileSn.replace("/upload/", ""));
		    fis = new FileInputStream(file);
	
		    in = new BufferedInputStream(fis);
		    bStream = new ByteArrayOutputStream();
	
		    int imgByte;
		    while ((imgByte = in.read()) != -1) {
		    	bStream.write(imgByte);
		    }
	
		    String fileExtsn = fileSn.substring(fileSn.lastIndexOf(".")).toLowerCase();
			String type = "";
			
			if (fileExtsn != null && !"".equals(fileExtsn)) {
			    type = "image/" + fileExtsn;
			}
		
			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());
		
			bStream.writeTo(response.getOutputStream());
		
			response.getOutputStream().flush();
			response.getOutputStream().close();			
			// 2011.10.10 보안점검 후속조치 끝
		}
		finally {
			if(bStream != null) {
				try {
					bStream.close();
				}
				catch (Exception ignore) {
				}
			}
			if(in != null) {
				try {
					in.close();
				}
				catch (Exception ignore) {
				}
			}
			if(fis != null) {
				try {
					fis.close();
				}
				catch (Exception ignore) {
				}
			}
		}
    }
}