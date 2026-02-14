package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        String URL = System.getenv("DB_URL");
        String USER = System.getenv("DB_USER");
        String PASSWORD = System.getenv("DB_PASS");

        if (URL == null || USER == null || PASSWORD == null) {
            throw new Exception("Environment variables not set properly.");
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
