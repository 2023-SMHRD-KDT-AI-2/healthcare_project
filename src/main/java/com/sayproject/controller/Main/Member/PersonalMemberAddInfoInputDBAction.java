package com.sayproject.controller.Main.Member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;

public class PersonalMemberAddInfoInputDBAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);
		/************* DATA 를 받아 DB 에 저장한다 ************/
	}
}
