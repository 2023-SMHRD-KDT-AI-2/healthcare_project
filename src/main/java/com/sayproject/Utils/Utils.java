package com.sayproject.Utils;

public class Utils {
  public static boolean isInteger(String strValue) {
    try {
      Integer.parseInt(strValue);
      return true;
    } catch (NumberFormatException ex) {
      return false;
    }
  }
}
