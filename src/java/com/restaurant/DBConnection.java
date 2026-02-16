package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");

            // Render PostgreSQL connection details
            String URL = "jdbc:postgresql://dpg-d698p26mcj7s738kv76g-a.oregon-postgres.render.com:5432/restaurantdb_9uyr?sslmode=require";
            String USER = "admin";
            String PASSWORD = "JJmR5tx2uEw71oOUZdwQKjQApcql58ulX";

            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
