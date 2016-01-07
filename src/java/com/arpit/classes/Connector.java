package com.arpit.classes;

import java.sql.*;

/**
 *
 * @author megha
 */
public class Connector {

    private static Connection con = null;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/custombook", "root", "arpit");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
