package Projet.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Projet.model.Donateur;

public class DonateurDao {
	private String jdbcUrl = "jdbc:mysql://localhost:3306/projetfinetude";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";

	private static final String INSERT_DONATEUR_SQL = "INSERT INTO donateur (CIN, NomDonateur, PrenomDonateur, sexe, ville, groupage, DateDeNaissance, numTele, email, motDePasse) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	public DonateurDao() {
	}

	// Establishes a connection to the database
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

	// Insert a new donator into the database
	public void insertDonteur(Donateur donateur) throws SQLException {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DONATEUR_SQL)) {
			preparedStatement.setString(1, donateur.getcIN());
			preparedStatement.setString(2, donateur.getNomDonateur());
			preparedStatement.setString(3, donateur.getPrenomDonateur());
			preparedStatement.setString(4, donateur.getSexe());
			preparedStatement.setString(5, donateur.getVille());
			preparedStatement.setString(6, donateur.getGroupage());
			preparedStatement.setDate(7, (Date) donateur.getDateDeNaissance());
			preparedStatement.setString(8, donateur.getNumTele());
			preparedStatement.setString(9, donateur.getEmail());
			preparedStatement.setString(10, donateur.getMotDePasse());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// check if the donator is in database
	public Donateur CheckDonateur(String email, String motDePasse) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			stmt = conn.prepareStatement("SELECT * FROM donateur WHERE email = ? AND motDePasse= ?");
			stmt.setString(1, email);
			stmt.setString(2, motDePasse);
			rs = stmt.executeQuery();
			if (rs.next()) {
				// Donator exists in the database
				// Create a new Donator object with the data from the result set
				Donateur donateur = new Donateur();
				donateur.setcIN(rs.getString("cIN"));
				donateur.setNomDonateur(rs.getString("NomDonateur"));
				donateur.setPrenomDonateur(rs.getString("PrenomDonateur"));
				donateur.setVille(rs.getString("Ville"));
				donateur.setSexe(rs.getString("Sexe"));
				donateur.setGroupage(rs.getString("Groupage"));
				donateur.setEmail(rs.getString("Email"));
				donateur.setMotDePasse(rs.getString("MotDePasse"));
				donateur.setDateDeNaissance(rs.getDate("DateDeNaissance"));
				donateur.setNumTele(rs.getString("NumTele"));
				return donateur;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
}
