package com.sayproject.model.Members.MemberDayilyInfo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OtherFood {
	@SerializedName("foodname")
	@Expose
	private String foodname;
	@SerializedName("gram")
	@Expose
	private Integer gram;
	@SerializedName("calorie")
	@Expose
	private Integer calorie;
}
