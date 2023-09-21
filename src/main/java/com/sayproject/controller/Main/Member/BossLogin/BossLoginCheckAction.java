package com.sayproject.controller.Main.Member.BossLogin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.Document;
import org.bson.conversions.Bson;
import com.google.gson.Gson;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.sayproject.controller.Action;
import com.sayproject.database.mongodb.MongoDBManager;
import com.sayproject.model.Main.BossLogin.BossAccount;

public class BossLoginCheckAction implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("application/json; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    final String masterId = request.getParameter("masterid");
    final String masterPassword = request.getParameter("masterpassword");

    MongoDBManager dbManager = null;
    try {
      dbManager = MongoDBManager.getInstance();
      MongoDatabase db = dbManager.dbManager();
      MongoCollection<Document> docuCollection = db.getCollection("master");

      Bson filter = Filters.eq("masterid", masterId);
      Document document = docuCollection.find(filter).first();
      if (document != null) {
        Gson gson = new Gson();
        BossAccount bossAccount = gson.fromJson(document.toJson(), BossAccount.class);
        if (bossAccount.getMasterid().equals(masterId) && bossAccount.getPassword().equals(masterPassword)) {
          HttpSession httpSession = request.getSession();
          httpSession.setAttribute("grade", "master");
          httpSession.setAttribute("loginType", "master");
          httpSession.setAttribute("memberObjectId", bossAccount.getNo());
          httpSession.setAttribute("masterId", bossAccount.getMasterid());
          httpSession.setAttribute("name", bossAccount.getMastername());
          httpSession.setAttribute("age", bossAccount.getMasterage());
          httpSession.setAttribute("nickname", bossAccount.getMastername());
          httpSession.setAttribute("profileImageUrl",
              "https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/1cb0fb10ddaf6.png");
          response.sendRedirect("/Main.say?c=main");
        } else {
          request.setAttribute("errorMessage", "비밀번호가 틀렸습니다.");
          request.getRequestDispatcher("/Main.say?c=bossLogin").forward(request, response);
        }
      } else {
        request.setAttribute("errorMessage", "해당 아이디가 존재하지 않습니다.");
        request.getRequestDispatcher("/Main.say?c=bossLogin").forward(request, response);
      }
    } finally {
      dbManager.close();
    }
  }
}
