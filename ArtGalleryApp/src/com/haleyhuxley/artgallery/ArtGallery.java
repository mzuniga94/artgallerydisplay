package com.haleyhuxley.artgallery;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.BorderLayout;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import com.haleyhuxley.tables.Artist;

public class ArtGallery {

	private JFrame frame;
	private JTable table;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		
		DBUtil.StartConnection();
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ArtGallery window = new ArtGallery();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public ArtGallery() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 800, 545);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JButton btnLoadTable = new JButton("Load Data");
		btnLoadTable.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					Connection conn = DBUtil.getConnection();
					String query = "SELECT * FROM artist";
					
					PreparedStatement stmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					ResultSet rs = stmt.executeQuery();
					
					String[] columnNames = {"First Name", "Middle Name", "Last Name"};
					DefaultTableModel tableModel = new DefaultTableModel(columnNames, 0);
					
					// TODO: Figure out how to make an abstract class/method to get all the results from the table.
					while(rs.next()) {
						String firstName = rs.getObject("firstName", String.class);
						String middleName = rs.getObject("middleName", String.class);
						String lastName = rs.getObject("lastName", String.class);
						
						String data[] = { firstName, middleName, lastName };

						tableModel.addRow(data);
					}
					
					table.setModel(tableModel);
					
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} 
			}
		});
		frame.getContentPane().add(btnLoadTable, BorderLayout.SOUTH);
		
		table = new JTable();
		frame.getContentPane().add(table, BorderLayout.CENTER);
	}

}
