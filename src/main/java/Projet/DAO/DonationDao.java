package Projet.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import Projet.model.Demandes;

public class DonationDao {

	
	
	 // Static method to check if the date is available for donation
    public static boolean isDateAvailable(Date dateDemande) throws SQLException, ClassNotFoundException {
        boolean isAvailable = true;
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM demandes WHERE dateDemande = ?");
        ps.setDate(1, dateDemande);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            isAvailable = false;
        }
        con.close();
        return isAvailable;
    }
    //insert the available date in database 
    public static boolean insertDate(Demandes demande) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
        if (isDateAvailable(demande.getDateDemande())) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO demandes (CIN, dateDemande) VALUES (?, ?)");
            ps.setString(1, demande.getCIN());
            ps.setDate(2, demande.getDateDemande());
            ps.executeUpdate();
            con.close();
            return true;
        }
        con.close();
        return false;
    }
}
