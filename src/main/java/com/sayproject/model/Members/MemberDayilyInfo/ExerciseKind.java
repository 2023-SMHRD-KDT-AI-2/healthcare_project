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
public class ExerciseKind {

  @SerializedName("exercisename")
  @Expose
  private String exercisename;
  @SerializedName("time_minute")
  @Expose
  private Integer timeMinute;
  @SerializedName("calorie")
  @Expose
  private Integer calorie;

}