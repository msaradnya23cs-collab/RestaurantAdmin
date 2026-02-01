package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurantdb?useSSL=false&allowPublicKeyRetrieval=true",
                "root",
                "root75"
            );
            System.out.println("DB Connected Successfully");
            return c;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
