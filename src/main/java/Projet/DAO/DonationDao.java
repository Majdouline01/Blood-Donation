package Projet.DAO;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;

import Projet.model.Demandes;
import Projet.model.Donateur;
import Projet.model.ReceveurDemande;

public class DonationDao {
	//method cheks if the time between the two donations is 2 mnths
	public static boolean isSecondDateAtLeast58DaysLater(java.sql.Date dernierDateDon, java.sql.Date selectedDate) {
	    try {
	    	if (dernierDateDon == null) return true; //test demandes
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(dernierDateDon);
	        calendar.add(Calendar.DATE, 58);
	        java.util.Date utilDate = calendar.getTime();
	        Date minimumDate = new java.sql.Date(utilDate.getTime());
	        
	        return selectedDate.after(minimumDate) || selectedDate.equals(minimumDate);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	 // Static method to check if the date is available for donation
    public static boolean isDateAvailable(Date dateDemande, String cin) throws SQLException, ClassNotFoundException {
        boolean isAvailable = false;
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT dernierDateDon FROM donateur WHERE cin = ?");
        ps.setString(1, cin);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
        	Date dernierDateDon = rs.getDate("dernierDateDon");
        	if(isSecondDateAtLeast58DaysLater(dernierDateDon,dateDemande)) {
        		if(doesDonateurHasRequest0(cin))
        			return false;
        		else 
        			return true;
        	}else
        		return false;
        }
        con.close();
        return isAvailable;
    }
    //checks if donator has a request pending
    public static boolean doesDonateurHasRequest0(String cin) throws ClassNotFoundException, SQLException {
    	ResultSet rs = null;
    	Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM demandes WHERE CIN = ? AND isValidated = ?");
        ps.setString(1, cin);
        ps.setInt(2, 0);
        rs = ps.executeQuery();   
        if(rs.next())
        	return true;
        
        return false;
    }
    //insert the available date in database 
    public static boolean insertDate(Demandes demande) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
        if (isDateAvailable(demande.getDateDemande(),demande.getCIN())) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO demandes (CIN, dateDemande,type) VALUES (?, ?, ?)");
            ps.setString(1, demande.getCIN());
            ps.setDate(2, demande.getDateDemande());
            ps.setInt(3,demande.getType());
            ps.executeUpdate();
            con.close();
            return true;
        }
        con.close();
        return false;
    }
    //list for donator requests 
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
				demande.setId(rs.getInt("id"));
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
    //list for receiver requests 
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
				demande.setQuantiteSang(rs.getInt("QuantitéSang"));
				demande.setOrdonnance(rs.getBinaryStream("Ordonance"));
				demande.setStatut(rs.getInt("statut"));
				list.add(demande);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    } 
    //get all receiver demande with statut 0 //for ADMIN
    public ArrayList<ReceveurDemande> getAllDemandesReceveur() throws IOException {
    	Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ReceveurDemande> list = new ArrayList<ReceveurDemande>();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
			stmt = conn.prepareStatement("SELECT * FROM receveurdemande WHERE statut = 0 ORDER BY Date");
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
				demande.setOrdonnance(rs.getBinaryStream("Ordonance"));
				
				InputStream inputStream = rs.getBinaryStream("Ordonance");
	            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	            byte[] buffer = new byte[4096];
	            int bytesRead = -1;
	            while ((bytesRead = inputStream.read(buffer)) != -1) {
	                outputStream.write(buffer, 0, bytesRead);
	            }
	            byte[] fileContent = outputStream.toByteArray();
	            demande.setOrdonnanceFile(fileContent);
				
				list.add(demande);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    } 
    //get all today demandes donateur for ADMIN
    public ArrayList<Demandes> getAllDemandesDonateur() {
    	Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Demandes> list = new ArrayList<Demandes>();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
			stmt = conn.prepareStatement("SELECT * FROM demandes WHERE isValidated = 0 AND dateDemande = ?");
			LocalDate currentDate = LocalDate.now();
            stmt.setDate(1, java.sql.Date.valueOf(currentDate));
            
			rs = stmt.executeQuery();
			while (rs.next()) {
				Demandes demande = new Demandes();
				demande.setId(rs.getInt("id"));
				demande.setCIN(rs.getString("CIN"));
				demande.setDateDemande(java.sql.Date.valueOf(rs.getString("dateDemande")));
				demande.setIsValidated(rs.getInt("isValidated"));
				list.add(demande);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    } 
    //admin accepts receiver request
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
    //admin refuse the receiver request
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
