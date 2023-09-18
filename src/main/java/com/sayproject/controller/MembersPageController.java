package com.sayproject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Main.Member.RegistAttendenceAction;
import com.sayproject.controller.Members.MemberMainAction;
import com.sayproject.controller.Members.MembersListAction;
import com.sayproject.controller.Members.MembersListJsonAction;
import com.sayproject.controller.Members.member.MemberDailyInfoReadAjaxForMongoDBAction;
import com.sayproject.controller.Members.member.MemberDailyInfoInputAction;
import com.sayproject.controller.Members.member.MemberDailyInfoInputProcessAction;

public class MembersPageController {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = "default";
		if (request.getParameter("c") != null) {
			cmd = request.getParameter("c");
			Action action = router(cmd, response);
			action.execute(request, response);
		} else {
			Action action = router(cmd, response);
			action.execute(request, response);
		}
	}

	public Action router(String cmd, HttpServletResponse response) {
		/********** 전체 회원 overview page ********/
		if (cmd.equals("main")) {
			return new MemberMainAction();
		}
		/****** 회원 명단만 볼 수 있는 페이지 *********/
		if (cmd.equals("list")) {
			return new MembersListAction();
		}
		/******** 전체 회원 명단을 받아오는 주소 ********/
		if (cmd.equals("json")) {
			return new MembersListJsonAction();
		}
		/********** 회원의 식단, 운동 정보를 ajax 를 통해 json 형태로 받는 주소 *******/
		if (cmd.equals("member")) {
			return new MemberDailyInfoReadAjaxForMongoDBAction();
		}
		/********* 회원의 식단, 운동 정보 입력하는 페이지로 이동 *********/
		if (cmd.equals("input")) {
			return new MemberDailyInfoInputAction();
		}
		/********* 회원의 일일의 식단, 운동, 키, 몸무게 정보를 form, action 하는 주소 **********/
		if (cmd.equals("inputProcess")) {
			return new MemberDailyInfoInputProcessAction();
		}
		/***** 출석체크하는 주소******/
		if (cmd.equals("registAttendence")) {
			return new RegistAttendenceAction();
		}
		/******* 기본 페이지로 이동 ******/
		return new MemberMainAction();
	}
}
