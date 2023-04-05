package Projet.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public int getStockTypeId(String type) {
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
	
	public void incrementQuantite(String cin) {
		DonateurDao donateurDao = new DonateurDao();
        String bloodType = donateurDao.getGroupageByCIN(cin);
        int typeId = getStockTypeId(bloodType);
        
        String query = "UPDATE stock SET quantite = quantite + 1 WHERE id = ?";
        
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, typeId);
            statement.executeUpdate();
            
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
}
