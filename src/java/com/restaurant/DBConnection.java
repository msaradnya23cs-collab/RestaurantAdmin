package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Aiven DB connection using environment variables
            String url = System.getenv("DB_URL");       // e.g., jdbc:mysql://mysql-1ad1b9b-student-9e3.f.aivencloud.com:21886/defaultdb?ssl-mode=REQUIRED
            String user = System.getenv("DB_USER");     // e.g., avnadmin
            String pass = System.getenv("DB_PASS");     // your Aiven password

            Connection c = DriverManager.getConnection(url, user, pass);
            return c;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
