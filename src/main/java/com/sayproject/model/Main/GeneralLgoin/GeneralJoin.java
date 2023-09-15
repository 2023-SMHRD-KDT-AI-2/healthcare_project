package com.sayproject.model.Main.GeneralLgoin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class GeneralJoin {
	//일반회원가입
	
	private String idOrEmail;	//id
	private String name;		//name
	private String weight;		//weight
	private String height;		//height
	private String address;		//address
	private String phone_number;	//phone_number
	private String gender;		//gender
	private String birthday;	//birthday
	private String password;
	
	private int no;
	private int age;
	private int trainer;
	private String profileImageUrl;
	private String job;
	private String regist_day;
	private String kaka_id;
	private String credit_card;
	private String expiration_date;
	
	

}
