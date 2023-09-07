package com.sayproject.database.mongodb;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBManager {

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
    String uri =
        "mongodb+srv://${id}:${password}@${host}/?retryWrites=true&w=majority";
    String DATABASE = "${database}";
    MongoClient mongoClient = MongoClients.create(uri);
    MongoDatabase database = mongoClient.getDatabase(DATABASE);
    return database;
  }
}
