package com.sayproject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Diet.DietMainAction;
import com.sayproject.controller.Diet.GetFoodNameAction;
import com.sayproject.controller.Diet.MemberDietInformationInput;

public class DietPageController {
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
		if (cmd.equals("main")) {
			return new DietMainAction();
		}
		// MariaDB와 MonggoDB에서 데이터 주기 위한 Action
		// 해당 로직이 실행되도 GetFoodNameAction()을 실행하면
		// ajax를 통해 Diet.say를 요청하기 때문에 Diet.say로 페이지가 넘어감
		if (cmd.equals("foodCode")){
			return new GetFoodNameAction();
		}
		return new DietMainAction();
	}
	
}
