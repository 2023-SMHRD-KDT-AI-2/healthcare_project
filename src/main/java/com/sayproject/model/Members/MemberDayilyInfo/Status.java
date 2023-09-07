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
public class Status {

  @SerializedName("wegith")
  @Expose
  private Integer wegith;
  @SerializedName("height")
  @Expose
  private Integer height;

}
