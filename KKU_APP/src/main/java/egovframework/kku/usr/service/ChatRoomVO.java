package egovframework.kku.usr.service;

import java.util.Date;

public class ChatRoomVO { 
	private String roomId;
	private String writer;
	private String receiver;
	private String socketId;
	private int ifOtherConnect;
	
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSocketId() {
		return socketId;
	}
	public void setSocketId(String socketId) {
		this.socketId = socketId;
	}
	public int getIfOtherConnect() {
		return ifOtherConnect;
	}
	public void setIfOtherConnect(int ifOtherConnect) {
		this.ifOtherConnect = ifOtherConnect;
	}
	@Override
	public String toString() {
		return "ChatRoomVO [roomId=" + roomId + ", writer=" + writer + ", receiver=" + receiver + ", socketId="
				+ socketId + ", ifOtherConnect=" + ifOtherConnect + "]";
	}

}
