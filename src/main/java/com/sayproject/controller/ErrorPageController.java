package com.sayproject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Error.Error403Action;
import com.sayproject.controller.Error.Error500Action;

public class ErrorPageController {
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
		if (cmd.equals("403")) {
			return new Error403Action();
		}
		if (cmd.equals("404")) {
			return new Error403Action();
		}
		if (cmd.equals("500")) {
			return new Error500Action();
		}
		return new Error500Action();
	}
}
