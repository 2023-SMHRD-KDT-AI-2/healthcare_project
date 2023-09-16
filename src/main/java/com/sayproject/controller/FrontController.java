package com.sayproject.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.reflection.SystemMetaObject;

import com.sayproject.controller.Main.LoginAction;
import com.sayproject.controller.Main.MainAction;
import com.sayproject.model.Members.Member;
import com.sayproject.model.Members.MembersDAO;

@WebServlet(urlPatterns = "*.say")
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 4059632197844714506L;
	private static final String CHARSET = "UTF-8";

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String subStringRequestURI = requestURI.substring(contextPath.length());

		System.out.println("=====================");
		System.out.println("requestURI : " + requestURI);
		System.out.println("contextPath : " + contextPath);
		System.out.println("subStringRequestURI : " + subStringRequestURI);
		
		Enumeration<String> parameter = request.getParameterNames();
		
		while(parameter.hasMoreElements()) {
			String element = parameter.nextElement();
			System.out.println("parameter : " + element);
			System.out.println("parameter value : " + request.getParameter(element));
		}
		System.out.println("=====================");
		if (subStringRequestURI.contains("/Main.say")) {
			MainPageController mainPageController = new MainPageController();
			mainPageController.doProcess(request, response);
		} else if (subStringRequestURI.contains("/Diet.say")) {
			DietPageController dietPageController = new DietPageController();
			dietPageController.doProcess(request, response);
		} else if (subStringRequestURI.contains("/Exercise.say")) {
			ExercisePageController exercisePageController = new ExercisePageController();
			exercisePageController.doProcess(request, response);
		} else if (subStringRequestURI.contains("/Members.say")) {
			MembersPageController membersPageController = new MembersPageController();
			membersPageController.doProcess(request, response);
		} else if (subStringRequestURI.contains("/Error.say")) {
			ErrorPageController errorPageController = new ErrorPageController();
			errorPageController.doProcess(request, response);
		}
	}
}
