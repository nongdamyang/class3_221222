package com.itwillbs.spring_mvc_board_ysj.controller;

import java.io.*;
import java.nio.file.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.itwillbs.spring_mvc_board_ysj.service.*;
import com.itwillbs.spring_mvc_board_ysj.vo.*;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	// 글쓰기 폼 
	@GetMapping(value = "/BoardWriteForm.bo")
	public String writeForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("target", "MemberLoginForm.me");
			return "success";
		}
		
		return "board/board_write_form";
	}
	
	
//	@PostMapping(value = "/BoardWritePro.bo")
//	public String writePro(String board_name, String board_subject, String board_content, MultipartFile file) {
//		System.out.println(board_name + ", " + board_subject + ", " + board_content);
//		System.out.println("업로드 파일명 : " + file.getOriginalFilename());
//		return "";
//	}
	
//	@PostMapping(value = "/BoardWritePro.bo")
//	public String writePro(@RequestParam Map<String, String> map, MultipartFile file) {
//		System.out.println(map.get("board_name") + ", " + map.get("board_subject") + ", " + map.get("board_content"));
//		System.out.println("업로드 파일명 : " + file.getOriginalFilename());
//		return "";
//	}
	
	@PostMapping(value = "/BoardWritePro.bo")
	public String writePro(BoardVO board, HttpSession session, Model model) {
//		System.out.println(board);
//		System.out.println("업로드 파일명 : " + board.getFile().getOriginalFilename());
		String uploadDir = "/resources/upload";
//		String saveDir =  request.getRealPath(uploadDir);
		
		String saveDir =  session.getServletContext().getRealPath(uploadDir);
//		System.out.println("실제 업로드 경로 : " + saveDir);
		
		try {
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			board.setBoard_file_path("/" + sdf.format(date));
			
			saveDir = saveDir + board.getBoard_file_path();
			
			Path path = Paths.get(saveDir);
			
			Files.createDirectories(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MultipartFile mFile = board.getFile();
		
		String originalFileName = mFile.getOriginalFilename();
		System.out.println(originalFileName);
		
		
		String uuid = UUID.randomUUID().toString();
//		System.out.println(uuid);
		
//		originalFileName = UUID.randomUUID().toString() + "_" + originalFileName;
		
		board.setBoard_file(uuid.substring(0, 8) + "_" + originalFileName);

		//----------------------------------------------------------------------------
		
		int insertCount = service.registBoard(board);
		
		if(insertCount > 0) {
			
			try {
				mFile.transferTo(new File(saveDir, board.getBoard_file()));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "redirect:/BoardList.bo";
		} else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "fail_back";
		}
		
	}
	
	@GetMapping(value = "/BoardList.bo")
	public String boardList() {
		return "board/board_list";
	}
}
























































