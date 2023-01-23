package egovframework.kku.usr.service;

import java.nio.ByteBuffer;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.BinaryMessage;


public class MessageVO { 
	private String roomId;
	private String imgId;
	private String writer;
	private String message;
	private String readCheck;
	private String receiver;
	private String usrNick;
	private String base64;
	private String imageFile;
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getUsrNick() {
		return usrNick;
	}
	public void setUsrNick(String usrNick) {
		this.usrNick = usrNick;
	}

	public String getBase64() {
		return base64;
	}
	public void setBase64(String base64) {
		this.base64 = base64;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	public String getImgId() {
		return imgId;
	}
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	@Override
	public String toString() {
		return "MessageVO [roomId=" + roomId + ", imgId=" + imgId + ", writer=" + writer + ", message=" + message
				+ ", readCheck=" + readCheck + ", receiver=" + receiver + ", usrNick=" + usrNick + ", base64=" + base64
				+ ", imageFile=" + imageFile + "]";
	}


}
