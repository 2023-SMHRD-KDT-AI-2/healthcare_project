package com.sayproject.controller.Main.Member.GeneralLogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoinDAO;

public class GeneralIDCheckAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		// MemberAddInfo.jsp(아이디 넘어오는지 체크)
		System.out.println(request.getParameter("id"));
		// 아이디 중복체크DAO 객체 생성
		GeneralJoinDAO dao = new GeneralJoinDAO();
		// cnt가 1이면 중복O, 0이면 중복X
		int cnt = dao.generalIDCheck(request.getParameter("id"));

		// MemberAddInfo.jsp response응답 함
		PrintWriter writer = response.getWriter();
		writer.print(cnt);
	}
}