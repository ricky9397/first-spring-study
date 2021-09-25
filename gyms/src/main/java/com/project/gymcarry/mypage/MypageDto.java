package com.project.gymcarry.mypage;

public class MypageDto {

	private int infoidx;
	private String memidx;
	private String infocontent;
	private String infodate;
	private String infotype;

	public MypageDto(int infoidx, String memidx, String infocontent, String infodate, String infotype) {
		this.infoidx = infoidx;
		this.memidx = memidx;
		this.infocontent = infocontent;
		this.infodate = infodate;
		this.infotype = infotype;
	}

	public int getInfoidx() {
		return infoidx;
	}

	public void setInfoidx(int infoidx) {
		this.infoidx = infoidx;
	}

	public String getMemidx() {
		return memidx;
	}

	public void setMemidx(String memidx) {
		this.memidx = memidx;
	}

	public String getInfocontent() {
		return infocontent;
	}

	public void setInfocontent(String infocontent) {
		this.infocontent = infocontent;
	}

	public String getInfodate() {
		return infodate;
	}

	public void setInfodate(String infodate) {
		this.infodate = infodate;
	}

	public String getInfotype() {
		return infotype;
	}

	public void setInfotype(String infotype) {
		this.infotype = infotype;
	}

	@Override
	public String toString() {
		return "MypageDto [infoidx=" + infoidx + ", memidx=" + memidx + ", infocontent=" + infocontent + ", infodate="
				+ infodate + ", infotype=" + infotype + "]";
	}

	public MypageDto() {

	}

}
