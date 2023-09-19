package com.sayproject.controller.Main.Member.BossLogin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.Document;
import com.google.gson.Gson;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.sayproject.controller.Action;
import com.sayproject.database.mongodb.MongoDBManager;
import com.sayproject.model.Main.BossLogin.BossAccount;

public class BossLoginCheckAction implements Action {
    private static final String CHARSET = "utf-8";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8");
        request.setCharacterEncoding(CHARSET);

        String bossID = request.getParameter("bossID");
        String bossPassword = request.getParameter("bossPassword");

        MongoDBManager dbManager = null;
        try {
            dbManager = MongoDBManager.getInstance();
            MongoDatabase db = dbManager.dbManager();
            MongoCollection<Document> docuCollection = db.getCollection("master");

            Document query = new Document().append("bossID", bossID)
                    .append("bossPassword", bossPassword);
            Document document = docuCollection.find(query).first();
            if (document != null) {
                Gson gson = new Gson();
                BossAccount bossAccount = gson.fromJson(document.toJson(), BossAccount.class);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("loginType", "master");
                httpSession.setAttribute("memberObjectId", bossAccount.getNo());
                httpSession.setAttribute("masterId", bossAccount.getMasterid());
                httpSession.setAttribute("name", bossAccount.getMastername());
                httpSession.setAttribute("age", bossAccount.getMasterage());
                httpSession.setAttribute("nickname", bossAccount.getMastername());
                httpSession.setAttribute("profileImageUrl",
                        "https://cdn.imweb.me/upload/S20221129c3c04fdc67a8b/1cb0fb10ddaf6.png");
                response.sendRedirect("/Main.say?c=main");
            }
        } finally {
            if (dbManager != null)
                dbManager.close();
        }
    }
}