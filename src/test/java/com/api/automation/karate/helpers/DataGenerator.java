package com.api.automation.karate.helpers;

import com.github.javafaker.Faker;

public class DataGenerator{
    static Faker fake = new Faker();

    public static  String getRandomEmail(){
        String email = fake.name().firstName().toLowerCase() +fake.random().nextInt(0,100) + "@test.com";
        return email;
    }

    public static  String getUserName(){
        String userName = fake.name().username();
        return userName;
    }

    public static  String getTitle(){
        String title = fake.name().title();
        return title;
    }

    public static  String getDescription(){
        String description = fake.dragonBall().character();
        return description;
    }
    public static  String getArticleBody(){
        String body = fake.name().title();
        return body;
    }

}
