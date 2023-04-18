package com.itwillbs.spring_mvc_board_ysj.vo;

import java.sql.*;

import org.springframework.web.multipart.*;

public class BoardVO {
	private int board_num;
	private String board_name;
	private String board_subject;
	private String board_content;
	private String board_file; // 파일명
	private String board_file_path;
	private int board_re_ref;
	private int board_re_lev;
	private int board_re_seq;
	private int board_readcount; 
	private Timestamp board_date;
	
	// 파일 업로드
	
	// 단일 파일
	private MultipartFile file;
	
	// 복수개의 파일
//	private MultipartFile[] files;
	

	public int getBoard_num() {
		return board_num;
	}


	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}


	public String getBoard_name() {
		return board_name;
	}


	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}


	public String getBoard_subject() {
		return board_subject;
	}


	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}


	public String getBoard_content() {
		return board_content;
	}


	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}


	public String getBoard_file() {
		return board_file;
	}


	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}


	public String getBoard_file_path() {
		return board_file_path;
	}


	public void setBoard_file_path(String board_file_path) {
		this.board_file_path = board_file_path;
	}


	public int getBoard_re_ref() {
		return board_re_ref;
	}


	public void setBoard_re_ref(int board_re_ref) {
		this.board_re_ref = board_re_ref;
	}


	public int getBoard_re_lev() {
		return board_re_lev;
	}


	public void setBoard_re_lev(int board_re_lev) {
		this.board_re_lev = board_re_lev;
	}


	public int getBoard_re_seq() {
		return board_re_seq;
	}


	public void setBoard_re_seq(int board_re_seq) {
		this.board_re_seq = board_re_seq;
	}


	public int getBoard_readcount() {
		return board_readcount;
	}


	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}


	public Timestamp getBoard_date() {
		return board_date;
	}


	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}

	public MultipartFile getFile() {
		return file;
	}
	
	
	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", board_name=" + board_name + ", board_subject=" + board_subject
				+ ", board_content=" + board_content + ", board_file=" + board_file + ", board_file_path="
				+ board_file_path + ", board_re_ref=" + board_re_ref + ", board_re_lev=" + board_re_lev
				+ ", board_re_seq=" + board_re_seq + ", board_readcount=" + board_readcount + ", board_date="
				+ board_date + ", file=" + file + "]";
	}

}

















































