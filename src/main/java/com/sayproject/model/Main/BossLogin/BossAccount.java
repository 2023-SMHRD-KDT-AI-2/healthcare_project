package com.sayproject.model.Main.BossLogin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BossAccount {

  private int no;
  private String masterid;
  private String password;
  private String mastername;
  private int masterage;
}
