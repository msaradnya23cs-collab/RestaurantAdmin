package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get DB credentials from environment variables
            String url = System.getenv("DB_URL");      // e.g. jdbc:mysql://host:port/dbname?useSSL=true&verifyServerCertificate=true&requireSSL=true
            String user = System.getenv("DB_USER");    // e.g. avnadmin
            String pass = System.getenv("DB_PASS");    // your Aiven password

            Connection c = DriverManager.getConnection(url, user, pass);
            return c;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
