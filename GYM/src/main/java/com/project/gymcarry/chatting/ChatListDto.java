package com.project.gymcarry.chatting;

public class ChatListDto {
	
	private int chatidx;
	private int cridx;
	private int memidx;
	private String crnick;
	private String placename;
	public ChatListDto() {
	}
	public ChatListDto(int chatidx, int cridx, int memidx, String crnick, String placename) {
		this.chatidx = chatidx;
		this.cridx = cridx;
		this.memidx = memidx;
		this.crnick = crnick;
		this.placename = placename;
	}
	public int getChatidx() {
		return chatidx;
	}
	public void setChatidx(int chatidx) {
		this.chatidx = chatidx;
	}
	public int getCridx() {
		return cridx;
	}
	public void setCridx(int cridx) {
		this.cridx = cridx;
	}
	public int getMemidx() {
		return memidx;
	}
	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}
	public String getCrnick() {
		return crnick;
	}
	public void setCrnick(String crnick) {
		this.crnick = crnick;
	}
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
	@Override
	public String toString() {
		return "ChatListDto [chatidx=" + chatidx + ", cridx=" + cridx + ", memidx=" + memidx + ", crnick=" + crnick
				+ ", placename=" + placename + "]";
	}
	
	
	
	
//	private String crnick;
//	private String centername;
//	private String chatcontent;
//	@DateTimeFormat(pattern = "HH:mm a")
//	private Timestamp chatdate;
//	public int getChatidx() {
//		return chatidx;
//	}
//	public void setChatidx(int chatidx) {
//		this.chatidx = chatidx;
//	}
//	public String getCrnick() {
//		return crnick;
//	}
//	public void setCrnick(String crnick) {
//		this.crnick = crnick;
//	}
//	public String getCentername() {
//		return centername;
//	}
//	public void setCentername(String centername) {
//		this.centername = centername;
//	}
//	public String getChatcontent() {
//		return chatcontent;
//	}
//	public void setChatcontent(String chatcontent) {
//		this.chatcontent = chatcontent;
//	}
//	public Timestamp getChatdate() {
//		return chatdate;
//	}
//	public void setChatdate(Timestamp chatdate) {
//		this.chatdate = chatdate;
//	}
//	public Date getDate() {
//		return new Date(getChatdate().getTime());
//	}	

}