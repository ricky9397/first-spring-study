package com.project.gymcarry.mypage;

import org.springframework.web.multipart.MultipartFile;

public class MypagePhotoDto {
	private int infoidx;
	private String memidx;
	private MultipartFile infocontent;
	private String infodate;
	private String infotype;

	public MypagePhotoDto() {
	}

	public MypagePhotoDto(int infoidx, String memidx, MultipartFile infocontent, String infodate, String infotype) {
		super();
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

	public MultipartFile getInfocontent() {
		return infocontent;
	}

	public void setInfocontent(MultipartFile infocontent) {
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

	public MypageDto getMypageDto() {
		return new MypageDto(infoidx, memidx, infocontent.getOriginalFilename(), infodate, infotype);
	}
		

}
