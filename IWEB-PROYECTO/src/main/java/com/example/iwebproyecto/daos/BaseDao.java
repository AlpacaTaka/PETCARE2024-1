package com.example.iwebproyecto.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public abstract class BaseDao {

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        String user = "root";
        String pass = "Lookmedfg321*";
        String url = "jdbc:mysql://localhost:3306/basededatostele";

        return DriverManager.getConnection(url, user, pass);
    }
}
