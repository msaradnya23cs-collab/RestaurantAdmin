package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection c = DriverManager.getConnection(
                System.getenv("DB_URL"),
                System.getenv("DB_USER"),
                System.getenv("DB_PASS")
            );

            System.out.println("DB Connected Successfully");
            return c;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
