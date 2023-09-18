package com.sayproject.controller.Main.Member;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;
import com.sayproject.controller.Script;
import com.sayproject.model.Members.Member;
import com.sayproject.model.Members.MembersDAO;

public class RegistAttendenceAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		String oid = request.getParameter("oid");
		String name = request.getParameter("name");
		String trainerNumber = request.getParameter("trainerNumber");

		LocalDate currentDate = LocalDate.now();
		// 날짜를 원하는 형식으로 출력하기 위해 DateTimeFormatter를 사용합니다.
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// 현재 날짜를 지정한 형식으로 출력합니다.
		String formattedDate = currentDate.format(formatter);

		System.out.println("oid" + oid);
		System.out.println("name" + name);
		System.out.println("trainerNumber" + trainerNumber);
		System.out.println("today" + formattedDate);

		Member member = new Member();
		member.setNo(Integer.parseInt(oid));
		member.setName(name);
		member.setTrainer(Integer.parseInt(trainerNumber));
		member.setRegist_day(formattedDate);

		MembersDAO dao = new MembersDAO();
		// 기록이 있는지 확인
		int cnt = dao.duplicateAttendence(member);
		System.out.println(cnt);

		if (cnt > 0) {// 금일 출석기록이 있다!
			Script.back("출석체크 이미 되어 있습니다", response);
		} else {
			cnt = dao.RegistAttendenceAction(member);

			if (cnt > 0) {
				response.sendRedirect("/Members.say");
			} else {
				Script.back("출석체크 실패", response);
			}
		}

	}
}