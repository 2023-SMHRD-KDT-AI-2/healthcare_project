package com.sayproject.controller.HttpApi;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.sayproject.controller.Action;
import com.sayproject.model.Main.TrainerLogin.TrainerAccount;
import com.sayproject.model.Main.TrainerLogin.TrainerLoginDAO;

public class AllTrainer implements Action{
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    TrainerLoginDAO trainerLoginDAO = new TrainerLoginDAO();
    ArrayList<TrainerAccount> arrayListAllTrainerAccount = trainerLoginDAO.getAllTrainer();
    
    Gson gson = new Gson();
    
    String returnJson = gson.toJson(arrayListAllTrainerAccount);
    
    try (PrintWriter outPrinter = response.getWriter()) {
      outPrinter.print(returnJson);
    }
  }
}
