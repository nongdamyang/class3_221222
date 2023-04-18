package com.itwillbs.spring_mvc_board_ysj.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.spring_mvc_board_ysj.mapper.*;
import com.itwillbs.spring_mvc_board_ysj.vo.*;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	public int registMember(MemberVO member) {
		
		
		return mapper.insertMember(member);
	}

	public String getPasswd(String id) {
		
		return mapper.selectPasswd(id);
	}

	public MemberVO getMemberInfo(String id) {
		
		return mapper.selectMemberInfo(id);
	}

	public int updateMemberInfo(MemberVO member, String newPasswd) {
		
		return mapper.updateMemberInfo(member, newPasswd);
	}

	public int quitMember(String id) {
		// TODO Auto-generated method stub
		return mapper.deleteMember(id);
	}

}
