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
public class MemberDailyData {
  @SerializedName("daily_data")
  @Expose
  private List<DailyInfo> dailyData;
  @SerializedName("_id")
  @Expose
  private Integer id;
  @SerializedName("name")
  @Expose
  private String name;
  @SerializedName("trainer")
  @Expose
  private Integer trainer;
}
