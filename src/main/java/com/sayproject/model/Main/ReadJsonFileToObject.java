package com.sayproject.model.Main;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;
import com.google.gson.Gson;
import com.sayproject.model.Members.MemberDayilyInfo.MemberDailyData;

public class ReadJsonFileToObject {
  public static void main(String[] args) throws FileNotFoundException {

      // FileReader 생성
      Reader reader = new FileReader("C:\\Users\\Home\\Downloads\\daily.json");

      // Json 파일 읽어서, Lecture 객체로 변환
      Gson gson = new Gson();
      MemberDailyData memberDailyData = gson.fromJson(reader, MemberDailyData.class);

      
      String jSon = gson.toJson(memberDailyData, MemberDailyData.class);
      System.out.println(jSon);
  }
}
