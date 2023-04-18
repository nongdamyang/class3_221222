package com.itwillbs.spring_mvc_board_ysj.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.spring_mvc_board_ysj.service.*;
import com.itwillbs.spring_mvc_board_ysj.vo.*;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
//	@GetMapping(value = "/MemberCheckDupId.me")
//	public void check() {
//		System.out.println("확인");
//	}
	
	//MemberJoinForm.me
	@GetMapping(value = "/MemberJoinForm.me")
	public String joinForm() {
		return "member/member_join_form";
	}
	
	@PostMapping(value = "/MemberJoinPro.me")
	public String joinPro(MemberVO member, Model model) {
		
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		String securePasswd = passwordEncoder.encode(member.getPasswd());
//		System.out.println("평문 : " + member.getPasswd());
//		System.out.println("암호문 : " + securePasswd);
		
		member.setPasswd(securePasswd); // 덮어쓰기
		
		int insertCount = service.registMember(member);
		
		if(insertCount > 0) {
			return "redirect:/"; // 루트로 이동 
		} else {
			model.addAttribute("msg", "회원 가입 실패!");
			return "fail_back";
		}
	}
	
	// 로그인 페이지로 이동  
	@GetMapping(value = "/MemberLoginForm.me")
	public String loginForm() {
		return "member/member_login_form";
	}
	
	// 로그인 처리 
	@PostMapping(value = "/MemberLoginPro.me")
	public String loginPro(MemberVO member, Model model, HttpSession session) {
		
		System.out.println(member);
		
		// 패스워드 암호화 
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		String securePasswd = passwordEncoder.encode(member.getPasswd());
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		String passwd = service.getPasswd(member.getId());
//		System.out.println(passwd);
		
		if(passwd == null || !passwordEncoder.matches(member.getPasswd(), passwd)) { // 로그인 실패 시 
			model.addAttribute("msg", "로그인 실패!");
			return "fail_back";
		} else { // 로그인 성공 시 
			session.setAttribute("sId", member.getId());
			return "redirect:/";
		}
		
	}
	
	// 로그아웃 
	@GetMapping(value = "/MemberLogout.me")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원 정보 페이지로 이동 
	@GetMapping(value = "/MemberInfo.me")
	public String memberInfo(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		
		MemberVO member = service.getMemberInfo(id);
		
//		member.setEmail1(member.getEmail().split("@")[0]);
//		member.setEmail2(member.getEmail().split("@")[1]);
		
		
		
		model.addAttribute("member", member);
		
		return "member/member_info";
	}
	
	// 회원 정보 수정 후 
	@PostMapping(value = "/MemberUpdate.me")
	public String memberUpdate(MemberVO member, @RequestParam String newPasswd, Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String passwd = service.getPasswd(member.getId());
		
		if(passwd == null || !passwordEncoder.matches(member.getPasswd(), passwd)) {
			model.addAttribute("msg", "수정 권한 없음!");
			return "fail_back";
		}
		
		if(!newPasswd.equals("")) {
			newPasswd = passwordEncoder.encode(newPasswd);
		}
		
		int updateCount = service.updateMemberInfo(member, newPasswd);
		
		if(updateCount > 0) {
			model.addAttribute("msg", "회원 정보 수정 성공!");
			model.addAttribute("target", "MemberInfo.me");
			return "success";
		} else {
			model.addAttribute("msg", " 회원 정보 수정 실패!");
			return "fail_back";
		}
		
		
	}
	
	//회원 탈퇴 
	@GetMapping(value = "/MemberQuitForm.me")
	public String quitForm() {
		return "member/member_quit_form";
	}
	
	@PostMapping(value = "/MemberQuitPro.me")
	public String quitPro(@RequestParam String passwd, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		String dbPasswd = service.getPasswd(id);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(passwd, dbPasswd)) {
			int deleteCount = service.quitMember(id);
			
			if(deleteCount > 0) {
				session.invalidate(); // 로그아웃 
				model.addAttribute("msg", "탈퇴가 완료되었습니다!");
				model.addAttribute("target", "./");
				return "success";
			} else {
				model.addAttribute("msg", "탈퇴 실패!");
				return "fail_back";
			}
			
		} else {
			model.addAttribute("msg", "권한이 없습니다!");
			return "fail_back";
		}
		
	
		
	}
	
}


















































