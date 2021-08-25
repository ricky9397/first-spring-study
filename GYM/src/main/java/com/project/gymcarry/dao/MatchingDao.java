package com.project.gymcarry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.gymcarry.carry.CarryDtoTest;
import com.project.gymcarry.chatting.ChatListDto;
import com.project.gymcarry.chatting.ChatRoomDto;

// matching DAO
public interface MatchingDao {
	
	// 채팅 리스트
	List<ChatRoomDto> selectChattingList(int chatidx);
	// 채팅방 리스트
	List<ChatListDto> selectChatList();
	// 매칭캐리리스트
	List<CarryDtoTest> selectCarryList();
	// 채팅방 생성
	int insertAddChatRoom(@Param("cridx") int cridx, @Param("memidx") int memidx);
	// 채팅방 중복확인
	List<ChatListDto> selectByChatRoom(int crnick);
}
