package Projet.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Projet.model.Admin;
import Projet.model.Donateur;

public class AdminDao {
	private String jdbcUrl = "jdbc:mysql://localhost:3306/projetfinetude";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	
	public AdminDao() {
		
	}
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public Admin CheckAdmin(String email, String motDePasse) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			stmt = conn.prepareStatement("SELECT * FROM admin WHERE email = ? AND motDePasse= ?");
			stmt.setString(1, email);
			stmt.setString(2, motDePasse);
			rs = stmt.executeQuery();
			if (rs.next()) {
				// Admin exists in the database
				// Create a new Admin object with the data from the result set
				Admin admin = new Admin();
				admin.setcIN(rs.getString("idAdmin"));
				admin.setNomAdmin(rs.getString("NomAdmin"));
				admin.setPrenomAdmin(rs.getString("PrenomAdmin"));
				admin.setEmail(rs.getString("email"));
				admin.setMotDePasse(rs.getString("motDePasse"));
				admin.setNumTele(rs.getString("NumTele"));
				return admin;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	
}
