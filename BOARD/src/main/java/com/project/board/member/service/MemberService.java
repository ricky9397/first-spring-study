package com.project.board.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.board.dao.MemberDao;

@Service
public class MemberService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTempalte;
	
	MemberDao memberDao;

	public int memberJoin(String id, String pw) {
		memberDao = sqlSessionTempalte.getMapper(MemberDao.class);
		return memberDao.insertJoin(id, pw);
	}
	
	
}
