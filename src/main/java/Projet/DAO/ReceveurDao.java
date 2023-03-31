package Projet.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Projet.model.Receveur;

public class ReceveurDao {
	private String jdbcUrl="jdbc:mysql://localhost:3306/projetfinetude";
	private String jdbcUsername="root";
	private String jdbcPassword="";
	

  private static final String INSERT_Receveur_SQL = "INSERT INTO receveur (CIN, NomReceveur, PrenomReceveur, sexe, ville, numTele, DateDeNaissance, QuantiteSang, email, Groupage, motDePasse) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
  
  public ReceveurDao() {
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
  // Insert a new receiver into the database
  public void insertReceveur(Receveur receveur) throws SQLException {
      try (Connection connection = getConnection();
           PreparedStatement preparedStatement = connection.prepareStatement(INSERT_Receveur_SQL)) {
          preparedStatement.setString(1, receveur.getcIN());
          preparedStatement.setString(2, receveur.getNomReceveur());
          preparedStatement.setString(3, receveur.getPrenomReceveur());
          preparedStatement.setString(4, receveur.getSexe());
          preparedStatement.setString(5, receveur.getVille());
          preparedStatement.setString(6, receveur.getNumTele());
          preparedStatement.setDate(7, (Date) receveur.getDateDeNaissance());
          preparedStatement.setFloat(8, receveur.getQuantiteSang());
          preparedStatement.setString(9, receveur.getEmail());
          preparedStatement.setString(10, receveur.getGroupage());
          preparedStatement.setString(11, receveur.getMotDePasse());
          preparedStatement.executeUpdate();
      } catch (SQLException e) {
          e.printStackTrace();
      }
      }
  //check if the receiver is in database
  public Receveur CheckReceveur(String email, String motDePasse) {
  	 Connection conn=null;
  	 PreparedStatement stmt=null;
  	 ResultSet rs =null;
      try {
          conn = getConnection();
          stmt = conn.prepareStatement("SELECT * FROM receveur WHERE email = ? AND motDePasse= ?");
          stmt.setString(1, email);
          stmt.setString(2, motDePasse);
          rs = stmt.executeQuery();
          if (rs.next()) {
              // User exists in the database
              // Create a new User object with the data from the result set
        	  Receveur receveur = new Receveur();
        	  receveur.setcIN(rs.getString("cIN"));
        	  receveur.setNomReceveur(rs.getString("NomReceveur"));
        	  receveur.setPrenomReceveur(rs.getString("PrenomReceveur"));
        	  receveur.setVille(rs.getString("Ville"));
        	  receveur.setSexe(rs.getString("Sexe"));
        	  receveur.setNumTele(rs.getString("NumTele"));
        	  receveur.setDateDeNaissance(rs.getDate("DateDeNaissance"));
        	  receveur.setQuantiteSang(rs.getFloat("QuantiteSang"));
        	  receveur.setEmail(rs.getString("Email"));
        	  receveur.setGroupage(rs.getString("Groupage"));
        	  receveur.setMotDePasse(rs.getString("MotDePasse"));
        	 
        	 
              return receveur;
          }
      } catch (SQLException e) {
          e.printStackTrace();
      } 
     return null;
}
}



