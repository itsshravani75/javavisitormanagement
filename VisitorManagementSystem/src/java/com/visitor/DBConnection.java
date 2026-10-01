package com.visitor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:derby://localhost:1527/VisitorDB";

    private static final String USER = "app";

    private static final String PASSWORD = "app";

    public static Connection getConnection()
            throws SQLException {

        try {

            Class.forName(
                    "org.apache.derby.jdbc.ClientDriver"
            );

            Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD
                    );

            System.out.println(
                    "Database Connected Successfully!"
            );

            return con;

        } catch (ClassNotFoundException e) {

            throw new SQLException(
                    "Derby JDBC Driver not found.",
                    e
            );
        }
    }
}