package com.sayproject.database.mongodb;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBManager {

  private MongoClient mongoClient = null;
  public MongoDBManager() {

  }

  public static MongoDBManager getInstance() {
    return LazyHoler.INSTANCE;
  }

  // private static inner class 인 LazyHolder
  private static class LazyHoler {
    // LazyHolder 클래스 초기화 과정에서 JVM 이 Thread-Safe 하게 instance 를 생성
    private static final MongoDBManager INSTANCE = new MongoDBManager();
  }

  public MongoDatabase dbManager() {
    String host = "cluster0.q3lazme.mongodb.net";    
    String username = "sentimentalhoon";
    String password = "L1XIq4QEJRuBXEmb";
    String dbName = "sayproject";
    String uri = String.format("mongodb+srv://%s:%s@%s/?retryWrites=true&w=majority", username, password, host);
    MongoClient mongoClient = MongoClients.create(uri);
    MongoDatabase database = mongoClient.getDatabase(dbName);
    return database;
  }
  
  public void close() {
    if (mongoClient != null) mongoClient.close();
  }
}
