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
public class Exercise {

    @SerializedName("kind")
    @Expose
    private String kind;
    @SerializedName("time_minute")
    @Expose
    private Integer timeMinute;
    @SerializedName("calorie")
    @Expose
    private Integer calorie;
}
