package com.sayproject.model.Main.KakaoLogin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KakaoJoin {
	//kakao 세션정보
	private String memberObjectId;	//id
	private String emailOrId;		//email
	private String profileImageUrl;	//profileimageurl
	private String nickname;		//nickname
	private String isDefaultImage;	//isDefaultImage		
	private String thumbnailImageUrl; //thumbnailImageUrl
	
	
	
	

}
