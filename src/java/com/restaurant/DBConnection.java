package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Read Render/Aiven environment variables
            String URL = System.getenv("DB_URL");      // Example: jdbc:mysql://yourhost:3306/dbname
            String USER = System.getenv("DB_USER");    // DB username
            String PASSWORD = System.getenv("DB_PASS"); // DB password

            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
