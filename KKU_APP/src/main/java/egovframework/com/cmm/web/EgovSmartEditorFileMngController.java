package egovframework.com.cmm.web;

import java.io.File;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.EgovKclicCommonUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.SmartEditorFileVO;

/**
 * @Class Name : EgovSmartEditorFileMngController.java
 * @Description : EgovSmartEditorFileMngController class
 * @Modification Information
 *
 * @author 정재우
 * @since 2015-01-09
 * @version 1.0
 * @see
 *
 * Copyright (C)  All right reserved.
 */
@Controller
public class EgovSmartEditorFileMngController {
    @RequestMapping("/SmartEditorFileUpload.do")
	public String SmartEditorFileUpload(HttpServletRequest request,
			@RequestParam(value="Filedata", required=false) MultipartFile file,
			@RequestParam(value="callback_func", required=false) String callback_func,
			@ModelAttribute("smartEditorFileVO") SmartEditorFileVO smartEditorFileVO) throws Exception {

    	if(!file.isEmpty()) {
			String rand_val = Integer.toString(new Random().nextInt(999999));
			String realFileName = file.getOriginalFilename();
			String fileNameExtension = realFileName.substring(realFileName.lastIndexOf(".")).toLowerCase();
			String fileId = EgovKclicCommonUtil.getTodayDateTime(14) + rand_val;
			String convertedFileName = fileId + fileNameExtension;
			file.transferTo(new File(EgovProperties.getProperty("Globals.fileStorePath") + "/editor/" + convertedFileName));

			if(file.getSize() <= 0 || realFileName.length() <= 0) {
				return "/kclicadm/_inc/callback";
			}

			smartEditorFileVO.setFileRealName(realFileName);
			smartEditorFileVO.setFileTmpCode(callback_func);
			smartEditorFileVO.setFileUpName(convertedFileName);
			request.getSession().setAttribute("smartEditorFileVO", smartEditorFileVO);
		}
		return "redirect:/Editorthread.do";
	}

    @RequestMapping("/Editorthread.do")
	public String Editorthread() throws Exception {
		Thread.sleep(1000);
		return "/kclicadm/_inc/callback";
	}
}