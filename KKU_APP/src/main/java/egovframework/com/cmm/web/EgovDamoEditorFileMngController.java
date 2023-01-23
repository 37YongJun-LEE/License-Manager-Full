package egovframework.com.cmm.web;

import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.EgovCmsFileUtil;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.string.EgovStringUtil;

@Controller
public class EgovDamoEditorFileMngController {
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;

	private String folderName = "";

	/* 다모에디터 업로드 및 화면 처리 */
	@RequestMapping(value="/damoUpload.do")
	public String damoUpload(HttpServletResponse response, HttpServletRequest request, SessionStatus status, ModelMap model) throws Exception {
		MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
		Iterator<String> fileIter = mptRequest.getFileNames();

		folderName = "editor";
 		while (fileIter.hasNext()) {
			String inputFileName = fileIter.next();
			MultipartFile mFile = mptRequest.getFile(inputFileName);

			if (mFile.getSize() > 0) {
				String fileName = EgovCmsFileUtil.imageFileSingleUpload(mFile, folderName);
				if(EgovStringUtil.isNotEmpty((String)fileName)) {
					model.addAttribute("result", "/upload/editor/" + fileName);
					return "kab/adm/_inc/ajaxResult";
				}
			}
		}
 		return "kab/adm/_inc/ajaxResult";
	}
}