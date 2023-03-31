package Projet.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import Projet.model.ReceveurDemande;

public class ReceiverRequestDao {
	
	 //insert the request in database 
    public void insertRequest(ReceveurDemande demande) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
        
            PreparedStatement ps = con.prepareStatement("INSERT INTO receveurdemande (CIN, Hopital, date, maladie, QuantitéSang, Ordonance, statut) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, demande.getcIN());
            ps.setString(2, demande.getHopital());
            ps.setDate(3, demande.getDate());
            ps.setString(4, demande.getMaladie());
            ps.setFloat(5, demande.getQuantiteSang());
            ps.setBytes(6, demande.getOrdonnance());
            ps.setString(7, demande.getcIN());
            ps.executeUpdate();
            con.close();
    }
}
