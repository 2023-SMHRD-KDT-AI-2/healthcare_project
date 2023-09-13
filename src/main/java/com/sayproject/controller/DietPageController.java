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
		}else if (cmd.equals("inputInfo")) {
          return new MemberDietInformationInput();
		}
		if (cmd.equals("foodname")){
			return new GetFoodNameAction();
		}
		return new DietMainAction();
	}
	
}
