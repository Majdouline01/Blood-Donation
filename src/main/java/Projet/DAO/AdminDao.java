package Projet.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import Projet.model.Admin;
import Projet.model.Demandes;
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
	
	public boolean isDateBeforeToday(String date) {
		LocalDate currentDate = LocalDate.now();
        // Parse the date passed in parameter
        LocalDate compareDate = LocalDate.parse(date);
        // Compare the two dates
        return compareDate.isBefore(currentDate);
	}
	
	public void deleteOldDemandes() {
		Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            stmt = conn.prepareStatement("UPDATE demandes SET isValidated = -1 WHERE isValidated = 0 AND dateDemande < ?");
            
            // Set parameter to today's date
            LocalDate currentDate = LocalDate.now();
            stmt.setDate(1, java.sql.Date.valueOf(currentDate));
            int rowsAffected = stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

    }
	}
	
	public String getCINByIdDemande(int id) {
        String cin = null;
        String query = "SELECT CIN FROM demandes WHERE id = ?";
        
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                cin = resultSet.getString("cin");
            }
            
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return cin;
    }
	
	public Demandes getDemandeByIdDemande(int id) {
        Demandes demande = new Demandes();
        String query = "SELECT * FROM demandes WHERE id = ?";
        
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
            	demande.setId(resultSet.getInt("id"));
            	demande.setCIN(resultSet.getString("cin"));
            	demande.setDateDemande(resultSet.getDate("dateDemande"));
            	demande.setIsValidated(resultSet.getInt("isValidated"));
            	demande.setType(resultSet.getInt("type"));
            }
            
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return demande;
    }
	
	public boolean setDernierDateDon(int idDemande) {
		Connection conn = null;
        PreparedStatement stmt = null;
        Demandes demande = new Demandes();
        demande = getDemandeByIdDemande(idDemande);
        String cin = demande.getCIN();
        StockDao stockDao = new StockDao();
        
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            stmt = conn.prepareStatement("UPDATE donateur SET dernierDateDon = ? WHERE CIN = ?");
            stmt.setDate(1,demande.getDateDemande());
            stmt.setString(2, cin);
            int numRowsUpdated = stmt.executeUpdate();
            return numRowsUpdated == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false; // Update was not successful
	}
	
	
	public boolean accepterDemandeDonateur(int idDemande) {
		//System.out.print("accepterDemandeDonateur");
    	Connection conn = null;
        PreparedStatement stmt = null;
        Demandes demande = new Demandes();
        Date dateDemande = demande.getDateDemande();
        StockDao stockDao = new StockDao();
        
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            stmt = conn.prepareStatement("UPDATE demandes SET isValidated = 1 WHERE id = ?");
            stmt.setInt(1, idDemande);
            int numRowsUpdated = stmt.executeUpdate();
            setDernierDateDon(idDemande);
            stockDao.incrementQuantite(getCINByIdDemande(idDemande));
            return numRowsUpdated == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false; // Update was not successful
    }
	
	public boolean refuserDemandeDonateur(int idDemande) {
    	Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            stmt = conn.prepareStatement("UPDATE demandes SET isValidated = -1 WHERE id = ?");
            stmt.setInt(1, idDemande);
            int numRowsUpdated = stmt.executeUpdate();
            return numRowsUpdated == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false; // Update was not successful
    }
	
	
}
