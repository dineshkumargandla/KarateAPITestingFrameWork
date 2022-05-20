package com.api.automation.karate.helpers;

public class Constants {

    static String existingPassword = "dinesh123";
    static String existingEmail = "dinesh@test.com";
    static String existingUserName = "dinesh123";


    public static String getExistingUserName() {
        return existingUserName;
    }

    public static void setExistingUserName(String existingUserName) {
        Constants.existingUserName = existingUserName;
    }



    public static String getExistingEmail() {
        return existingEmail;
    }

    public static void setExistingEmail(String existingEmail) {
        Constants.existingEmail = existingEmail;
    }

    public static String getExistingPassword() {
        return existingPassword;
    }

    public static void setExistingPassword(String existingPassword) {
        Constants.existingPassword = existingPassword;
    }
}
