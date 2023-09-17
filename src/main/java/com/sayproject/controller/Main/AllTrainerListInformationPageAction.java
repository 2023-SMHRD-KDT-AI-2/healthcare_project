package com.sayproject.controller.Main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;
import com.sayproject.model.Main.TrainerLogin.TrainerAccount;
import com.sayproject.model.Main.TrainerLogin.TrainerLoginDAO;

public class AllTrainerListInformationPageAction  implements Action {
    private static final String CHARSET = "utf-8";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding(CHARSET);

        TrainerLoginDAO trainerLoginDAO = new TrainerLoginDAO();
        ArrayList<TrainerAccount> arrayListAllTrainerAccount = trainerLoginDAO.getAllTrainer();
        
        request.setAttribute("arrayListAllTrainerAccount", arrayListAllTrainerAccount);
        
        RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Main/AllTrainerListInformationAction.jsp");
        dis.forward(request, response);
    }
}