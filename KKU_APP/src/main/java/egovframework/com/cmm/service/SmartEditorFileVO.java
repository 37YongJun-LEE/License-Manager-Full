package egovframework.com.cmm.service;

import java.io.Serializable;

/**
 * @Class Name : SmartEditorFileVO.java
 * @Description : SmartEditorFile VO class
 * @Modification Information
 *
 * @author 정재우
 * @since 2015-01-09
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */

public class SmartEditorFileVO implements Serializable {
	private static final long serialVersionUID = 7329796197896890322L;

	public String fileRealName = "";
    public String fileUpName = "";
    public String fileTmpCode = "";

	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public String getFileUpName() {
		return fileUpName;
	}
	public void setFileUpName(String fileUpName) {
		this.fileUpName = fileUpName;
	}
	public String getFileTmpCode() {
		return fileTmpCode;
	}
	public void setFileTmpCode(String fileTmpCode) {
		this.fileTmpCode = fileTmpCode;
	}
}