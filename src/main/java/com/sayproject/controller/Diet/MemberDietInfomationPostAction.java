package com.sayproject.controller.Diet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;

public class MemberDietInfomationPostAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		/*
		 * 회원의 식단 정보 입력시 넘어올 정보
		 * {
		 * 회원 번호 _id
		 * 회원 이름 name
		 * 트레이너 번호 trainer
		 * 
		 * == dailyInfo ===
		 * [
		 * {
		 * breakfast [ {foodname : value, gram : value, calorie : value }] 아침 내용 ( 음식이름,
		 * 그램수, 칼로리 )
		 * lunch [ {foodname : value, gram : value, calorie : value }] 점심 내용 ( 음식이름,
		 * 그램수, 칼로리 )
		 * dinner [ {foodname : value, gram : value, calorie : value }] 저녁 내용 ( 음식이름,
		 * 그램수, 칼로리 )
		 * otherfood [ {foodname : value, gram : value, calorie : value }] 그외 내용 ( 음식이름,
		 * 그램수, 칼로리 )
		 * 
		 * 
		 * day 날짜
		 * 
		 * status.weight 몸무게
		 * status.height 신장
		 * 
		 * ========================================
		 * 회원의 운동 정보 입력시 넘어오는 정보
		 * 
		 * 회원 번호 _id
		 * 회원 이름 name
		 * 트레이너 번호 trainer
		 * exercise [ {kind:value, time_minute:value, calorie:value}]
		 * 운동 내용 ( 운동이름, 운동시간, 소모한 칼로리 )
		 * 
		 * 날짜 day
		 * 몸무게 status.weight
		 * 신장 status.height
		 * }
		 * ]
		 * }
		 */
		// Enumeration<String> names = request.getParameterNames();
		// names.nextElement();
		// while (names.asIterator().next() != null) {
		// System.out.println(names.asIterator().next());
		// }

		RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Exercise/exercise_main.jsp");
		dis.forward(request, response);
	}
}