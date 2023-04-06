package Projet.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Projet.model.*;

public class StockDao {
	private String jdbcUrl = "jdbc:mysql://localhost:3306/projetfinetude";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";

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
	//function you give it the blood type name and it gives u it's id
	public int getBloodId(String type) {
        int id = -1;
        String sql = "SELECT id FROM stock WHERE type = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, type);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                id = result.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }
	public String getCINReceveur(int idDemande) {
		String cin = "";
        String sql = "SELECT CIN FROM receveurdemande WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, idDemande);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
            	cin = result.getString("CIN");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cin;
	}
	
	public String getBloodType(String CinReceveur) {
		String bloodType = "";
        String sql = "SELECT Groupage FROM receveur WHERE CIN = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, CinReceveur);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
            	bloodType = result.getString("CIN");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bloodType;
	}
	
	//function you give it the cin of donateur and it update the quantity of his blood type
	public boolean incrementQuantite(String cin) {
	    DonateurDao donateurDao = new DonateurDao();
	    String bloodType = donateurDao.getGroupageByCIN(cin);
	    int typeId = getBloodId(bloodType);

	    String query = "UPDATE stock SET quantite = quantite + 1 WHERE id = ?";

	    try {
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
	        PreparedStatement statement = connection.prepareStatement(query);
	        statement.setInt(1, typeId);
	        statement.executeUpdate();

	        statement.close();
	        connection.close();
	        return true; // Query executed successfully, return true
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false; // Exception occurred, return false
	    }
	}
	
	public  ArrayList<String> getCompatibleBloodTypes(String bloodType) {
		ArrayList<String> donorBloodTypes = new ArrayList<String>();

        switch(bloodType) {
            case "O+":
                donorBloodTypes.add("O+");
                donorBloodTypes.add("A+");
                donorBloodTypes.add("B+");
                donorBloodTypes.add("AB+");
                break;
            case "O-":
                donorBloodTypes.add("O+");
                donorBloodTypes.add("O-");
                donorBloodTypes.add("A+");
                donorBloodTypes.add("A-");
                donorBloodTypes.add("B+");
                donorBloodTypes.add("B-");
                donorBloodTypes.add("AB+");
                donorBloodTypes.add("AB-");
                break;
            case "A+":
                donorBloodTypes.add("A+");
                donorBloodTypes.add("AB+");
                break;
            case "A-":
                donorBloodTypes.add("A+");
                donorBloodTypes.add("A-");
                donorBloodTypes.add("AB+");
                donorBloodTypes.add("AB-");
                break;
            case "B+":
                donorBloodTypes.add("B+");
                donorBloodTypes.add("AB+");
                break;
            case "B-":
                donorBloodTypes.add("B+");
                donorBloodTypes.add("B-");
                donorBloodTypes.add("AB+");
                donorBloodTypes.add("AB-");
                break;
            case "AB+":
                donorBloodTypes.add("AB+");
                break;
            case "AB-":
                donorBloodTypes.add("AB+");
                donorBloodTypes.add("AB-");
                break;
            default:
                System.out.println("Invalid blood type");
                break;
        }

        return donorBloodTypes;
    }
	
	
	public boolan AccepterDemandeReceveur(int idDemande, String type, int quantity) {
		
		String cinReceveur = getCINReceveur(idDemande);
		String bloodType = getBloodType(cinReceveur);
		ArrayList<String> compatibleBloodTypes = getCompatibleBloodTypes(bloodType);
		
		
		ArrayList<ReceveurDemande> demandes = new ArrayList<ReceveurDemande>();
	    String query = "SELECT * FROM demandes WHERE isValidated = 1 AND type = ? ORDER BY dateDemande LIMIT ?";
	    
	    try {
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
	        PreparedStatement statement = connection.prepareStatement(query);
	        statement.setString(1, type);
	        statement.setInt(2, quantity);
	        ResultSet resultSet = statement.executeQuery();
	        
	        // Check if the number of retrieved demandes is equal to or greater than the requested quantity
	        int count = 0;
	        while (resultSet.next()) {
	            count++;
	            Demande demande = new Demande();
	            demande.setId(resultSet.getInt("id"));
	            demande.setCIN(resultSet.getString("CIN"));
	            demande.setDateDemande(resultSet.getDate("dateDemande"));
	            demande.setIsValidated(resultSet.getInt("isValidated"));
	            demande.setType(resultSet.getString("type"));
	            
	            demandes.add(demande);
	        }
	        
	        resultSet.close();
	        statement.close();
	        
	        if (count >= quantity) {
	            // Update the isValidated field for the retrieved demandes
	            String updateQuery = "UPDATE demandes SET isValidated = 2 WHERE id IN (";
	            for (int i = 0; i < demandes.size(); i++) {
	                updateQuery += demandes.get(i).getId();
	                if (i != demandes.size() - 1) {
	                    updateQuery += ",";
	                }
	            }
	            updateQuery += ")";
	            
	            PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
	            updateStatement.executeUpdate();
	            updateStatement.close();
	            
	            // Decrement the quantity in the stock table
	            String decrementQuery = "UPDATE stock SET quantite = quantite - ? WHERE type = ?";
	            PreparedStatement decrementStatement = connection.prepareStatement(decrementQuery);
	            decrementStatement.setInt(1, quantity);
	            decrementStatement.setString(2, type);
	            decrementStatement.executeUpdate();
	            decrementStatement.close();
	            
	            connection.close();
	            return true;
	        } else {
	            connection.close();
	            return false;
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
}
