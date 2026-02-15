package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Read connection info from environment variables
            String host = System.getenv("DB_HOST");       // e.g. mysql-1ad1b9b-student-9e3.f.aivencloud.com
            String port = System.getenv("DB_PORT");       // e.g. 21886
            String db   = System.getenv("DB_NAME");       // e.g. defaultdb
            String user = System.getenv("DB_USER");       // e.g. avnadmin
            String pass = System.getenv("DB_PASS");       // e.g. your Aiven password

            String url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=true&requireSSL=true";

            return DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
