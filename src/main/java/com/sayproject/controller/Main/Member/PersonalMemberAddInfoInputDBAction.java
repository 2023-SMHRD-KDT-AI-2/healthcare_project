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

		String filename = request.getParameter("filename");
		String idOrEmail = request.getParameter("idOrEmail");
		String name = request.getParameter("name");
		String weight = request.getParameter("weight");
		String height = request.getParameter("height");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");

		System.out.println(filename);
		System.out.println(idOrEmail);
		System.out.println(name);
		System.out.println(weight);
		System.out.println(height);
		System.out.println(gender);
		System.out.println(birthday);

		/************* DATA 를 받아 DB 에 저장한다 ************/
	}
}
