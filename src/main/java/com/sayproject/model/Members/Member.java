package com.sayproject.model.Members;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor // 매개 변수를 입력 받는 생성자 메소드 지정
@NoArgsConstructor // 기본 생성자 메소드 지정
public class Member {
  private int no;
  private String name;
  private int age;
  private char gender;
  private int height;
  private int weight;
  private int trainer;
  private String photopath;
  private String job;
  private String address;
  private String regist_day;
  private String phone_number;
  private String kakao_id;
}
