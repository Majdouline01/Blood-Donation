package Projet.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import Projet.model.Demandes;
import Projet.model.Donateur;
import Projet.model.ReceveurDemande;

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
    
    public ArrayList<Demandes> getDemandes(String cin) {
    	Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Demandes> list = new ArrayList<Demandes>();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
			stmt = conn.prepareStatement("SELECT * FROM demandes WHERE CIN = ?");
			stmt.setString(1, cin);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Demandes demande = new Demandes();
				demande.setCIN(rs.getString("CIN"));
				demande.setDateDemande(java.sql.Date.valueOf(rs.getString("dateDemande")));
				demande.setIsValidated(Integer.parseInt(rs.getString("isValidated")));
				list.add(demande);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    }
    
    public ArrayList<ReceveurDemande> getDemandesReceveur(String cin) {
    	Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ReceveurDemande> list = new ArrayList<ReceveurDemande>();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
			stmt = conn.prepareStatement("SELECT * FROM receveurdemande WHERE CIN = ?");
			stmt.setString(1, cin);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ReceveurDemande demande = new ReceveurDemande();
				demande.setcIN(rs.getString("CIN"));
				demande.setDate(java.sql.Date.valueOf(rs.getString("Date")));
				demande.setHopital(rs.getString("Hopital"));
				demande.setMaladie(rs.getString("maladie"));
				demande.setStatut(rs.getInt("statut"));
				list.add(demande);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    } 
    
    public ArrayList<ReceveurDemande> getAllDemandesReceveur() {
    	Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ReceveurDemande> list = new ArrayList<ReceveurDemande>();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
			stmt = conn.prepareStatement("SELECT * FROM receveurdemande WHERE statut = 0");
			rs = stmt.executeQuery();
			while (rs.next()) {
				ReceveurDemande demande = new ReceveurDemande();
				demande.setId(rs.getInt("id"));
				demande.setcIN(rs.getString("CIN"));
				demande.setDate(java.sql.Date.valueOf(rs.getString("Date")));
				demande.setHopital(rs.getString("Hopital"));
				demande.setMaladie(rs.getString("maladie"));
				demande.setStatut(rs.getInt("statut"));
				demande.setQuantiteSang(rs.getInt("QuantitéSang"));
				list.add(demande);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    } 
    
    public boolean accepterDemandeReceveur(int idDemande) {
    	Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            stmt = conn.prepareStatement("UPDATE receveurdemande SET statut = 1 WHERE id = ?");
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
    public boolean refuserDemandeReceveur(int idDemande) {
    	Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
            stmt = conn.prepareStatement("UPDATE receveurdemande SET statut = -1 WHERE id = ?");
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
