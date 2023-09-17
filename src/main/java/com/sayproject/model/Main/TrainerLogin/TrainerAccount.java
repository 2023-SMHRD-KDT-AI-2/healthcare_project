package com.sayproject.model.Main.TrainerLogin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainerAccount {
    private int no;
    private String name;
    private String email;
    private String nickname;
    private String photopath;
    private String password;
    private String age;
}