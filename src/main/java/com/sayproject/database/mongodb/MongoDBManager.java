package com.sayproject.database.mongodb;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBClient {

  public MongoDBClient() {

  }

  public static MongoDBClient getInstance() {
    return LazyHoler.INSTANCE;
  }

  // private static inner class 인 LazyHolder
  private static class LazyHoler {
    // LazyHolder 클래스 초기화 과정에서 JVM 이 Thread-Safe 하게 instance 를 생성
    private static final MongoDBClient INSTANCE = new MongoDBClient();
  }

  public MongoClient dbManager() {
    String uri =
        "mongodb+srv://${id}:${password}@${host}/?retryWrites=true&w=majority";
    MongoClient mongoClient = MongoClients.create(uri);
    return mongoClient;
  }
}
