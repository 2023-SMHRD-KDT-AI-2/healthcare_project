package com.sayproject.model.Members.MemberDayilyInfo;

import java.util.List;

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
public class DailyInfo {
  @SerializedName("day")
  @Expose
  private Integer date;
  @SerializedName("diet")
  @Expose
  private Diet diet;
  @SerializedName("exercise")
  @Expose
  private List<Exercise> exercise;
  @SerializedName("status")
  @Expose
  private Status status;
}