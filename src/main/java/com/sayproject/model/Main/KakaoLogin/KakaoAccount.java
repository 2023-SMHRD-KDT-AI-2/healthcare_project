package com.sayproject.model.Main.KakaoLogin;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class KakaoAccount {
	
	@SerializedName("profile_nickname_needs_agreement")
	@Expose
	private Boolean profileNicknameNeedsAgreement;
	@SerializedName("profile_image_needs_agreement")
	@Expose
	private Boolean profileImageNeedsAgreement;
	@SerializedName("profile")
	@Expose
	private Profile profile;
	@SerializedName("has_email")
	@Expose
	private Boolean hasEmail;
	@SerializedName("email_needs_agreement")
	@Expose
	private Boolean emailNeedsAgreement;
	@SerializedName("is_email_valid")
	@Expose
	private Boolean isEmailValid;
	@SerializedName("is_email_verified")
	@Expose
	private Boolean isEmailVerified;
	@SerializedName("email")
	@Expose
	private String email;
	@SerializedName("has_age_range")
	@Expose
	private Boolean hasAgeRange;
	@SerializedName("age_range_needs_agreement")
	@Expose
	private Boolean ageRangeNeedsAgreement;
	@SerializedName("has_birthday")
	@Expose
	private Boolean hasBirthday;
	@SerializedName("birthday_needs_agreement")
	@Expose
	private Boolean birthdayNeedsAgreement;
	@SerializedName("has_gender")
	@Expose
	private Boolean hasGender;
	@SerializedName("gender_needs_agreement")
	@Expose
	private Boolean genderNeedsAgreement;
}
