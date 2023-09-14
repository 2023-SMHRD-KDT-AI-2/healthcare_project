package com.sayproject.controller.Main.Member.GeneralLogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;

public class GeneralIDCheckAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		System.out.println(request.getParameter("id"));
		PrintWriter writer = response.getWriter();
		
		
		
		writer.print("우리 팀장 바보");
	}
}