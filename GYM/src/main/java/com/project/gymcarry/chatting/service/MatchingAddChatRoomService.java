package com.project.gymcarry.chatting.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.chatting.ChatListDto;
import com.project.gymcarry.dao.MatchingDao;

@Service
public class MatchingAddChatRoomService {
	
	@Autowired
	private SqlSessionTemplate template;
	private MatchingDao dao;
	
	// 채팅방 생성
	public int getAddChatRoom(int cridx, int memidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.insertAddChatRoom(cridx, memidx);
	}
	
	// 채팅방 중복 확인
	public List<ChatListDto> getByChatRoom(int crnick) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectByChatRoom(crnick);
	}
	
	
}
