package egovframework.com.cmm;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
/*import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;*/
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.fdl.string.EgovStringUtil;


public class EgovCmsFileUtil {
	private final static String dir = EgovProperties.getProperty("Globals.fileStorePath");

	public static String fileSingleUpload(MultipartFile file, String folderName) throws Exception {
																//'trade'
		if(!file.isEmpty()){
			File repositoryDir = new File(dir + folderName);
			if(!repositoryDir.exists()) {
				if(!repositoryDir.mkdirs()) {
					throw new Exception("Fail to create a directory for attached file ["+ repositoryDir + "]");
				}
			}

			Random r = new Random();
			String rand_val = Integer.toString(r.nextInt(999999));
			
			String realFileName = file.getOriginalFilename();
			String fileNameExtension = realFileName.substring(realFileName.lastIndexOf(".")).toLowerCase();
			String fileId = EgovCmsCommonUtil.getTodayDateTime(14) + rand_val;
			String convertedFileName = fileId + fileNameExtension;

			try {
				file.transferTo(new File(dir + folderName + "/" + convertedFileName));
				return convertedFileName;
			}
			catch(Exception e) {
				return "";
			}
		}
		return "";
	}
	
	public static String fileReSizeUpload(MultipartFile file, String folderName, String fileName) throws Exception {
	      if(!file.isEmpty()){
	         File repositoryDir = new File(dir + folderName);
	         if(!repositoryDir.exists()) {
	            if(!repositoryDir.mkdirs()) {
	               throw new Exception("Fail to create a directory for attached file ["+ repositoryDir + "]");
	            }
	         }
	         
	         // 변경 할 넓이
	         int newWidth = 263;      
            int newHeigt = 263;      
            
            File convFile = new File(file.getOriginalFilename());
            file.transferTo(convFile);
	          
	           // 원본 이미지 가져오기
	           Image image = ImageIO.read(convFile);
	           
	           double ratio;
	          
	           // width resize =  (height resize * original width size) / original height size
	           // height resize = (width resize * original height size) / original width size

	           
	           
	           if(image.getHeight(null) < image.getWidth(null)){
	              newWidth =  (newWidth * image.getWidth(null)) / image.getHeight(null) ; 
	           }else if (image.getHeight(null) > image.getWidth(null)) {
	              newHeigt = (newHeigt * image.getHeight(null)) / image.getWidth(null);
	           }
	           
	           
	           // 이미지 이름 변환
	         String convertedFileName = fileName.split("\\.")[0] + "_1." + fileName.split("\\.")[1];
	          
	         // 이미지 리사이즈
	            // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
	            // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
	            // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
	            // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
	            // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
	         Image resizeImage = image.getScaledInstance(newWidth, newHeigt, Image.SCALE_SMOOTH);
	         
	         // 새 이미지  저장하기
	            BufferedImage newImage = new BufferedImage(newWidth, newHeigt, BufferedImage.TYPE_INT_RGB);
	            Graphics g = newImage.getGraphics();
	            g.drawImage(resizeImage, 0, 0, null);
	            g.dispose();
	         
	            ImageIO.write(newImage, fileName.split("\\.")[1], new File(dir + folderName + "/" + convertedFileName));
				return convertedFileName;
	         
	      }
			return "";
	   }	
	
	
	

	public static String imageFileSingleUpload(MultipartFile file, String folderName) throws Exception {
		if(!file.isEmpty()){
			File repositoryDir = new File(dir + folderName);
			if(!repositoryDir.exists()) {
				if(!repositoryDir.mkdirs()) {
					throw new Exception("Fail to create a directory for attached file ["+ repositoryDir + "]");
				}
			}

			Random r = new Random();
			String rand_val = Integer.toString(r.nextInt(999999));

			String realFileName = file.getOriginalFilename();
			String fileNameExtension = realFileName.substring(realFileName.lastIndexOf(".")).toLowerCase();
			String fileId = EgovCmsCommonUtil.getTodayDateTime(14) + rand_val;
			String convertedFileName = fileId + fileNameExtension;

			if(imageChk(convertedFileName)) {
				try {
					file.transferTo(new File(dir + folderName + "/" + convertedFileName));
					return convertedFileName;
				}
				catch(Exception e) {
					return "";
				}
			}
			else {
				return "";
			}
		}
		return "";
	}

	public static boolean fileChk(String str) {
		str = str.toLowerCase();
		String allowPattern = ".+\\.(jpg|jpeg|gif|png|bmp|xls|ppt|hwp|doc|xlsx|pdf|pptx|docx|zip|pdf)$";
		boolean result = false;
		  
		Pattern p = Pattern.compile(allowPattern);
		Matcher m = p.matcher(str);
		result = m.matches();
		
		return result;
	}

	public static boolean imageChk(String str) {
		str = str.toLowerCase();
		String allowPattern = ".+\\.(jpg|jpeg|gif|png|bmp)$";
		boolean result = false;
		
		Pattern p = Pattern.compile(allowPattern);
		Matcher m = p.matcher(str);
		result = m.matches();
		
		return result;
	}

	public static String asaFileSingleUpload(MultipartFile file) throws Exception {
		if(!file.isEmpty()){
			String asaDir = "C:/tomcat-asa/webapps/asapro/upload/";
			File repositoryDir = new File(asaDir);

			if(!repositoryDir.exists()) {
				if(!repositoryDir.mkdirs()) {
					throw new Exception("Fail to create a directory for attached file ["+ repositoryDir + "]");
				}
			}

			Random r = new Random();
			String rand_val = Integer.toString(r.nextInt(9999));
			String realFileName = file.getOriginalFilename();
			String fileNameExtension = realFileName.substring(realFileName.lastIndexOf(".")).toLowerCase();
			String fileId = EgovCmsCommonUtil.getTodayDateTime(14) + rand_val;
			String convertedFileName = "MANAGER_" + fileId + fileNameExtension;

			try {
				file.transferTo(new File(asaDir + convertedFileName));
				return convertedFileName;
			}
			catch(Exception e) {
				return "";
			}
		}
		return "";
	}
	
	public static String deleteFile(String folderName, String fileName) {
		if(folderName == null || folderName.equals("")) {
			return "";
		}
		
		if(fileName == null || fileName.equals("")) {
			return "";
		}
		
		String delTarget = dir + folderName  + "/" + fileName;
		String filePathBlackList = EgovCmsCommonUtil.filePathBlackList(delTarget);

		File file = new File(filePathBlackList);
		if(file.isFile()) {
			return deletePath(filePathBlackList);
		}
		else {
			return "";
		}
	}

	private static String deletePath(String filePath) {
		File file = new File(filePath);
		String result = "";
		try {
			if(file.exists()) {
				result = file.getAbsolutePath();
				if (!file.delete()) {
					result = "";
				}
			}
		}
		catch(Exception e) {
			throw new RuntimeException(e);
		}
		return result;
	}
	
	public static String checkFileSize(String oldFolderName, String fileName){
		String target = dir + oldFolderName + "/"+fileName;
		
		//String filePathBlackList = EgovCmsCommonUtil.filePathBlackList(target);
		File file = new File(target);
		try {
			if(file.exists()){
				// 존재하면 파일크기 체크한 뒤 리턴.
				Long fileSize = file.length();
				return String.valueOf(fileSize);
			} else {
				return "";
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void fileCopy(String oldFilePath, String newFilePath, String FileName) {
		String oldtarget = dir + oldFilePath + "/"+FileName;
		String newtarget = dir + newFilePath + "/"+FileName;
		
		File orgFile = new File(oldtarget);
	    File newFile = new File(newtarget);
	     
	    try {
	    	if(orgFile.exists()) {
		        orgFile.renameTo(newFile);
		    }
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	    
	    
	}

	
	/*public static void createZip(String zipFileName, ArrayList<String> files) {
		zipFileName = dir + zipFileName + ".zip";
		
		byte[] buf = new byte[4096];
		 
		try {
		    ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFileName));
		    out.setEncoding("EUC-KR");
		 
		    for (int i=0; i<files.size(); i++) {
		        FileInputStream in = new FileInputStream(dir + "qrcode/" + files.get(i));
//		        Path p = Paths.get(files[i]);
//		        String fileName = p.getFileName().toString();
		        
		        String p = FilenameUtils.getPath(dir + "qrcode/" + files.get(i));
		        String fileName = FilenameUtils.getBaseName(dir + "qrcode/" + files.get(i)) + ".jpg";
		        
//		        fileName = new String(fileName.getBytes("euc-kr"), "utf-8");
		        
		        
		        
		        ZipEntry ze = new ZipEntry("/"+fileName);
		        out.putNextEntry(ze);
		           
		        int len;
		        while ((len = in.read(buf)) > 0) {
		            out.write(buf, 0, len);
		        }
		           
		        out.closeEntry();
		        in.close();
		 
		    }
		           
		    out.close();
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}*/
	
	
}
