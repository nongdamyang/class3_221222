package com.itwillbs.spring_mvc_board_ysj.mapper;

import org.apache.ibatis.annotations.*;

import com.itwillbs.spring_mvc_board_ysj.vo.*;

public interface MemberMapper {

	// 회원 가입
	int insertMember(MemberVO member);

	// 로그인 처리 
	String selectPasswd(String id);

	// 회원 정보 조회
	MemberVO selectMemberInfo(String id);
	
	// 회원 정보 수정 
//	int updateMemberInfo(MemberVO member, String newPasswd); // 오류 발생
	int updateMemberInfo(@Param("member") MemberVO member, @Param("newPasswd") String newPasswd);

	// 회원 탈퇴 
	int deleteMember(String id);

}















































