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

public class Diet {

  @SerializedName("calorie")
  @Expose
  private Integer calorie;
  @SerializedName("breakfast")
  @Expose
  private List<Breakfast> breakfast;
  @SerializedName("lunch")
  @Expose
  private List<Lunch> lunch;
  @SerializedName("dinner")
  @Expose
  private List<Dinner> dinner;
  @SerializedName("nightmeal")
  @Expose
  private List<Nightmeal> nightmeal;

}
