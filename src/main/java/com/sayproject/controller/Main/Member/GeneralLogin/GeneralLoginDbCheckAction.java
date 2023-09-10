package com.sayproject.controller.Main.Member.GeneralLogin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;

public class GeneralLoginDbCheckAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		/*****
		 * 일반적인 로그인 상황에서 id와 password 값만 받아와 추가 정보를 받는 페이지로 이동한다.. password 는 sha256 을
		 * 통해서 암호화한다. salt, pepper 는 추후에 한다.
		 */
		String id = null;
		String password = null;
		if (request.getParameter("id") != null && request.getParameter("password") != null) {
			id = request.getParameter("id");
			password = request.getParameter("password");
			/********
			 * Kakao DB 에 접근해 해당 아이디가 존재하는지 확인한다. 존재한다면 /Main.say 페이지로 이동 존재하지 않는다면 추가 정보 입력
			 * 페이지로 이동하게 한다.
			 ********/

			/********** DB 에서 kakao 정보로 가입한 기록이 있는지 확인 ***********/
			/********** DB 에 정보가 존재한다면 디비 정보 업데이트 한 후 메인페이지로 이동 시킨다 ***/
			/********** session 에 기록한다 ************/
			// RequestDispatcher dis = request.getRequestDispatcher("/Main.say");
			// dis.forward(request, response);
			/********** DB 에 가입한 정보가 없다면 추가 정보 입력 페이지로 이동. ***********************/
			/********** DB 에 모든 정보를 입력하기 전까지는 session 에 저장하지 않는다. ****************/
			response.sendRedirect("/Main.say");
		} else {
			/************* parameter 값이 존재하지 않는다면 메인 페이지로 이동하게 한다. **********/
			response.sendRedirect("/Main.say");
		}
	}
}
