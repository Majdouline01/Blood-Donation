package Projet.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
            	bloodType = result.getString("Groupage");
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
	
	public String getBiggestStockType(ArrayList<String> types, int quantity) {
        String bestType = "";
        int maxQuantite = 0;
        
        try {
            // Connect to the MySQL database
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/projetfinetude",
                "root",
                ""
            );
            
            // Create a statement object
            Statement statement = connection.createStatement();
            
            // Iterate over each type
            for (String type : types) {
                // Execute the query to get the max quantite for the given type and quantity
                String query = "SELECT quantite FROM stock WHERE type='" + type + "' AND quantite >= " + quantity;
                ResultSet resultSet = statement.executeQuery(query);
                
                // Extract the max quantite from the result set
                int currentMaxQuantite = 0;
                while (resultSet.next()) {
                    currentMaxQuantite = resultSet.getInt(1);
                }
                
                // If the current max quantite is greater than the current best max quantite, update the best type and max quantite
                if (currentMaxQuantite > maxQuantite) {
                    maxQuantite = currentMaxQuantite;
                    bestType = type;
                }
            }
            
            // Close the statement and connection objects
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return bestType;
    }
	
	public ReceveurDemande getReceveurDemandeById(int id) {
        ReceveurDemande receveurDemande = null;
        
        try {
            // Connect to the MySQL database
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/projetfinetude",
                "root",
                ""
            );
            
            // Create a statement object
            Statement statement = connection.createStatement();
            
            // Execute the query to retrieve the row with the given id
            String query = "SELECT * FROM receveurdemande WHERE id=" + id;
            ResultSet resultSet = statement.executeQuery(query);
            
            // If a row is found, create a ReceveurDemande object with its values
            if (resultSet.next()) {
                String cin = resultSet.getString("CIN");
                String hopital = resultSet.getString("Hopital");
                Date date = resultSet.getDate("Date");
                String maladie = resultSet.getString("maladie");
                int quantiteSang = resultSet.getInt("QuantitéSang");
                //String ordonance = resultSet.getString("ordonance");
                int statut = resultSet.getInt("statut");
                receveurDemande = new ReceveurDemande(cin, hopital, date, maladie, quantiteSang, statut);
                receveurDemande.setId(id);
            }
            
            // Close the statement and connection objects
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return receveurDemande;
    }
	
	public Boolean AccepterDemandeReceveur(int idDemande) {
		ReceveurDemande demandeReceveur = getReceveurDemandeById(idDemande);
		//System.out.print(demandeReceveur);
		String cinReceveur = getCINReceveur(idDemande);
		//System.out.print(cinReceveur);
		String bloodType = getBloodType(cinReceveur);
		//System.out.print(bloodType);
		ArrayList<String> compatibleBloodTypes = getCompatibleBloodTypes(bloodType);
		//System.out.print(compatibleBloodTypes);
		String bestType = getBiggestStockType(compatibleBloodTypes,demandeReceveur.getQuantiteSang());
		//System.out.print(bestType);
		int bloodId = getBloodId(bestType);
		//System.out.print(bloodId);
		if(bestType == "") return false;
		
		//System.out.print("test Begin ");
		
		ArrayList<Demandes> demandes = new ArrayList<Demandes>();
	    String query = "SELECT * FROM demandes WHERE isValidated = 1 AND type = ? ORDER BY dateDemande LIMIT ?";
	    
	    try {
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
	        PreparedStatement statement = connection.prepareStatement(query);
	        statement.setInt(1, bloodId);
	        statement.setInt(2, demandeReceveur.getQuantiteSang());
	        ResultSet resultSet = statement.executeQuery();
	        
	        // Check if the number of retrieved demandes is equal to or greater than the requested quantity
	        int count = 0;
	        while (resultSet.next()) {
	            count++;
	            Demandes demande = new Demandes();
	            demande.setId(resultSet.getInt("id"));
	            demande.setCIN(resultSet.getString("CIN"));
	            demande.setDateDemande(resultSet.getDate("dateDemande"));
	            demande.setIsValidated(resultSet.getInt("isValidated"));
	            demande.setType(resultSet.getInt("type"));
	            
	            demandes.add(demande);
	        }
	        
	        resultSet.close();
	        statement.close();
	        
	        if (count >= demandeReceveur.getQuantiteSang()) {
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
	            decrementStatement.setInt(1, demandeReceveur.getQuantiteSang());
	            decrementStatement.setString(2, bestType);
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
	
	public ArrayList<Stock> getStockStats(){
		ArrayList<Stock> stocks = new ArrayList<>();
	    String query = "SELECT * FROM stock";
	    
	    try {
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
	        PreparedStatement statement = connection.prepareStatement(query);
	        ResultSet resultSet = statement.executeQuery();
	        
	        while (resultSet.next()) {
	            Stock stock = new Stock();
	            stock.setId(resultSet.getInt("id"));
	            stock.setType(resultSet.getString("type"));
	            stock.setQuantite(resultSet.getInt("quantite"));
	            
	            stocks.add(stock);
	        }
	        
	        resultSet.close();
	        statement.close();
	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return stocks;
	}
	
}
