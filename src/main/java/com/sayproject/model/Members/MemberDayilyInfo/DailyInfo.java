package com.sayproject.model.Members.MemberDayilyInfo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.sayproject.model.Exercise.Exercise;
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

  @SerializedName("date")
  @Expose
  private Integer date;
  @SerializedName("diet")
  @Expose
  private DailyInfo diet;
  @SerializedName("exercise")
  @Expose
  private Exercise exercise;
  @SerializedName("status")
  @Expose
  private Status status;

}
