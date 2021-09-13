package com.project.gymcarry.board.controller;

import com.project.gymcarry.board.BoardDto;
import com.project.gymcarry.board.Pagination;
import com.project.gymcarry.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;


    // 게시판 목록 조회 & 페이징 처리
    @GetMapping("community/boardList")
    public String getBoardList (Model model
                                ,@RequestParam(required = false, defaultValue = "1")int page
                                ,@RequestParam(required = false,defaultValue = "1")int range)
                                throws Exception{

        int listCnt = boardService.getBoardListCnt();

        // Pagination 객체 생성
        Pagination pagination = new Pagination();
        pagination.pageInfo(page, range, listCnt);

        model.addAttribute("pagination", pagination);
        model.addAttribute("boardList", boardService.getBoardList(pagination));
        
        System.out.println("test" + boardService.getBoardList(pagination).toString());

        return "community/community";

    }

    // ajax 카테고리 리스트
    @GetMapping("community/communication")
    @ResponseBody
    public List<BoardDto> getComuniCation(){
        List<BoardDto> list = boardService.getListCommuni();
        System.out.println(list);
        return list;
    }


}
