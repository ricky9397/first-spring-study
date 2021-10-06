package com.project.board.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.board.member.domain.MemberDto;
import com.project.board.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/member/joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	
	@PostMapping("/member/join")
	public String join(
			MemberDto memberDto,
			HttpSession session
			) {
		
		int result = memberService.memberJoin(memberDto.getId(), memberDto.getPw());
		
		
		return "redirect:index";
	}
	
}
