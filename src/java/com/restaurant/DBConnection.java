
    
    
    package com.restaurant;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConn() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");

            // Read Render environment variables
             String URL = System.getenv("jdbc:postgresql://dpg-d698p26mcj7s738kv76g-a.oregon-postgres.render.com:5432/restaurantdb_9uyr?sslmode=require");      // Render PostgreSQL JDBC URL
            String USER = System.getenv("admin");    // Render PostgreSQL user
            String PASSWORD = System.getenv("JJmR5tx2uEw71oUZdwQKjQApcql58ulX"); // Render PostgreSQL password

            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}


