package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Use environment variables instead of hardcoding credentials
            String URL = System.getenv("DB_URL");
            String USER = System.getenv("DB_USER");
            String PASSWORD = System.getenv("DB_PASS");

            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connected to Aiven MySQL successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
