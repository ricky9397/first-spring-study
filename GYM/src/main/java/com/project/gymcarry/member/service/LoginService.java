package com.project.gymcarry.member.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.carry.CarryDto;
import com.project.gymcarry.dao.MemberDao;
import com.project.gymcarry.member.MemberVO;
import com.project.gymcarry.member.SessionDto;

@Service
public class LoginService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberDao dao;
	
	// 멤버 로그인
	public SessionDto memberLogin(String id, String pw) {
		dao = template.getMapper(MemberDao.class);
		return dao.memberLogin(id, pw);
	}
	
	// 캐리 로그인 
	public SessionDto carryLogin(String id, String pw) {
		dao = template.getMapper(MemberDao.class);
		return dao.carryLogin(id, pw);
	}
	
	// 멤버 로그인 검사 
	public MemberVO memberjoinkeycheck(String id, String pw) {
		dao = template.getMapper(MemberDao.class);
		return dao.memberjoinkeycheck(id, pw);
	}
	
	// 캐리  로그인 검사 
	public CarryDto carryjoinkeycheck(String id, String pw) {
		dao = template.getMapper(MemberDao.class);
		return dao.carryjoinkeycheck(id, pw);
	}
	
	// 카카오 로그인(중복닉네임있을경우가입)
	public int insertKaKaoJoinOne(MemberVO memberDto) {
		dao = template.getMapper(MemberDao.class);
		return dao.insertKaKaoJoinOne(memberDto);
	}
	
	// 카카오 로그인 체크용
	public SessionDto memberLoginCheck(String snsjoinid) {
		dao = template.getMapper(MemberDao.class);
		return dao.selectKakaoLoginCheck(snsjoinid);
	}
	
	// sns 회원가입
	public int updateKakaoJoin(MemberVO memberDto) {
		dao = template.getMapper(MemberDao.class);
		return dao.updateKakaoJoin(memberDto);
	}

	public MemberVO selectLogin(Map<String, Object> inOutMap) {
		dao = template.getMapper(MemberDao.class);
		return dao.selectLogin(inOutMap);
	}
	


	
}
