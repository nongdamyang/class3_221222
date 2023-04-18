package com.itwillbs.spring_mvc_board_ysj.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.spring_mvc_board_ysj.mapper.*;
import com.itwillbs.spring_mvc_board_ysj.vo.*;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;

	public int registBoard(BoardVO board) {
		
		return mapper.insertBoard(board);
	}
	
	
}















































