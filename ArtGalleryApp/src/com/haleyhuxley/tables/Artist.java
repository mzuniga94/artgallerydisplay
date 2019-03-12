package com.haleyhuxley.tables;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Artist {

	public static void displayData(ResultSet rs) throws SQLException {
		
		while(rs.next()) {
			
			StringBuffer buffer = new StringBuffer();
			
			int artistId = rs.getObject("artistId", Integer.class);
			String firstName = rs.getObject("firstName", String.class);
			String middleName = rs.getObject("middleName", String.class);
			String lastName = rs.getObject("lastName", String.class);
			String birthPlace = rs.getObject("birthPlace", String.class);
			String birthDate = rs.getObject("birthDate", String.class);
			String artPeriod = rs.getObject("artPeriod", String.class);
			String bio = rs.getObject("bio", String.class);
			
			buffer.append("Artist ID: " + artistId + "\n");
			buffer.append("Name : " + firstName + " " + middleName + " " + lastName + "\n");
			buffer.append("Place of Birth: " + birthPlace + "\n");
			buffer.append("Date of Birth: " + birthDate + "\n");
			buffer.append("Art Period: " + artPeriod + "\n");
			buffer.append("Short Bio: " + bio + "\n");
		
			System.out.println(buffer.toString());
		}
	}
	
	public static void getArtistId(ResultSet rs) throws SQLException {
		while(rs.next()) {
			
		}
	}
	
}
