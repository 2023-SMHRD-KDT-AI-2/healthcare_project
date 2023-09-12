package com.sayproject.controller.Members.member;

import static com.mongodb.client.model.Filters.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.sayproject.Utils.Utils;
import com.sayproject.controller.Action;
import com.sayproject.database.mongodb.MongoDBManager;

public class MemberDailyInfoReadAjaxForMongoDBAction implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("application/json; charset=utf-8");
    request.setCharacterEncoding(CHARSET);
    String collection = null;
    String fieldName = null;
    String value = null;
    String valueType = null;
    String dataType = null;

    collection = request.getParameter("collection");
    fieldName = request.getParameter("fieldName");
    valueType = request.getParameter("valueType");
    value = request.getParameter("value");
    dataType = request.getParameter("dataType");
    if (collection == null || fieldName == null || valueType == null || value == null
        || dataType == null) {
      try (PrintWriter out = response.getWriter()) {
        out.print("N U L L");
      }
      return;
    }

    if (dataType.equals("json")) {
      try {
        MongoDatabase db = MongoDBManager.getInstance().dbManager();
        MongoCollection<Document> docuCollection = db.getCollection(collection);
        Document document = docuCollection
            .find(eq(fieldName, Utils.isInteger(value) ? Integer.parseInt(value) : value)).first();
        if (document != null) {
          String json = document.toJson();
          try (PrintWriter out = response.getWriter()) {
            out.print(json);
          }
        }
      } finally {
        MongoDBManager.getInstance().close();
      }
    }
  }
}
