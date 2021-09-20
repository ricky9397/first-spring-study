package com.project.gymcarry.mypage.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.gymcarry.dao.MypageDao;
import com.project.gymcarry.mypage.MypageDto;
import com.project.gymcarry.mypage.MypageDto2;
import com.project.gymcarry.mypage.MypagePhotoDto;

@Service
public class MypageService {

	@Autowired
	private SqlSessionTemplate template;

	private MypageDao dao;

	public int memberMemo(MypagePhotoDto mypDto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		dao = template.getMapper(MypageDao.class);
		MypageDto mypageDto = null;
		if(mypDto.getInfotype().equals("photo")) {
			File newFile = null;
			mypageDto = mypDto.getMypageDto();
			if (mypDto.getInfocontent() != null && !mypDto.getInfocontent().isEmpty()) {
				File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
				if (!newDir.exists()) {
					newDir.mkdir();
				}
				String newFileName = mypDto.getMemidx() + System.currentTimeMillis() + "."
						+ chkFileType(mypDto.getInfocontent());
				newFile = new File(newDir, newFileName);
				mypDto.getInfocontent().transferTo(newFile);
				mypageDto.setInfocontent(newFileName);
			} else {
				mypageDto.setInfocontent("profile2.png");
			}
			return dao.insertMemo(mypageDto);
		} else {
			mypageDto = mypDto.getMypageDto();
			return dao.insertMemo(mypageDto);
		}
		
	}

	public int updateMemo(MypagePhotoDto mypDto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		dao = template.getMapper(MypageDao.class);
		MypageDto mypageDto = null;
		if(mypDto.getInfotype().equals("photo")) {
			File newFile = null;
			mypageDto = mypDto.getMypageDto();
			if (mypDto.getInfocontent() != null && !mypDto.getInfocontent().isEmpty()) {
				File newDir = new File(request.getSession().getServletContext().getRealPath("/uploadfile"));
				if (!newDir.exists()) {
					newDir.mkdir();
				}
				String newFileName = mypDto.getMemidx() + System.currentTimeMillis() + "."
						+ chkFileType(mypDto.getInfocontent());
				newFile = new File(newDir, newFileName);
				mypDto.getInfocontent().transferTo(newFile);
				mypageDto.setInfocontent(newFileName);
			} else {
				mypageDto.setInfocontent("profile2.png");
			}
			return dao.updateMemo(mypageDto);
		}else {
			mypageDto = mypDto.getMypageDto();
			return dao.updateMemo(mypageDto);
		}
		
	}

	public List<MypageDto> selectMemo(String memidx, String infodate, String infotype) {
		dao = template.getMapper(MypageDao.class);
		return dao.selectMemo(memidx, infodate, infotype);
	}

	public List<MypageDto> loadMemo(String arg0, String arg1) {
		dao = template.getMapper(MypageDao.class);
		return dao.loadMemo(arg0, arg1);
	}

	public List<MypageDto2> loadMemo2(int i, String arg1) {
		dao = template.getMapper(MypageDao.class);
		return dao.loadMemo2(i, arg1);
	}

	public List<MypageDto2> selectMypageView(int memidx, String infodate) {
		dao = template.getMapper(MypageDao.class);
		return dao.selectMypageView(memidx, infodate);
	}
	
	private String chkFileType(MultipartFile file) throws Exception {
		String extension = "";
		String contentType = file.getContentType();
		if (!(contentType.equals("image/jpeg") || contentType.equals("image/jpg") || contentType.equals("image/png")
				|| contentType.equals("image/gif"))) {
			throw new Exception("허용하지 않는 파일 타입 : " + contentType);
		}
		String fileName = file.getOriginalFilename();
		String[] nameTokens = fileName.split("\\."); /// tet.mini2.jpg PNG png
		extension = nameTokens[nameTokens.length - 1].toLowerCase();
		if (!(extension.equals("jpg") || extension.equals("png") || extension.equals("gif"))) {
			throw new Exception("허용하지 않는 파일 확장자 타입 : " + contentType);
		}
		return extension;
	}

	public int memberMemos(MypageDto mypdto) {
		dao = template.getMapper(MypageDao.class);
		return dao.insertMemo(mypdto);
	}

	public int updateMemos(MypageDto mypdto) {
		dao = template.getMapper(MypageDao.class);
		return dao.updateMemo(mypdto);
	}
}
