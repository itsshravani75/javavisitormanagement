package com.visitor;

import java.sql.Connection;
import java.sql.SQLException;

public class DBTest {

    public static void main(String[] args) {

        try {

            Connection con = DBConnection.getConnection();

            if (con != null) {

                System.out.println(
                        "Database connection successful!"
                );

                con.close();

            } else {

                System.out.println(
                        "Database connection failed!"
                );
            }

        } catch (SQLException e) {

            System.out.println(
                    "Database connection error:"
            );

        }
    }
}