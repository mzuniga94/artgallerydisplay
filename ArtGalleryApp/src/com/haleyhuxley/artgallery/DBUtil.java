package com.haleyhuxley.artgallery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.haleyhuxley.tables.Artist;

public class DBUtil {
	
	// Setup database connection variables.
	private static final String USERNAME = "dbuser";
	private static final String PASSWORD = "dbpassword";
	private static final String CONN_STRING = "jdbc:mysql://localhost/artgallery";
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
	}
	
	public static void StartConnection() {
		try {
			Connection conn = DBUtil.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM artist");
					
			Artist.displayData(rs);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
