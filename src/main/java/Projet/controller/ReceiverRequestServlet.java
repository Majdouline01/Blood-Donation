package Projet.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Projet.DAO.DonationDao;
import Projet.DAO.ReceiverRequestDao;
import Projet.model.ReceveurDemande;


@WebServlet("/Request")
public class ReceiverRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    //retrieve data from the request
		String dateStr = req.getParameter("dateDeNaissance");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = null;
		try {
			utilDate = sdf.parse(dateStr);
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	    String hopital = req.getParameter("hopital");
	    String maladie = req.getParameter("maladie");
	    String quantiteSang = req.getParameter("quantiteSang");
	    System.out.println(sqlDate);
	    float parsedquantiteSang = Float.parseFloat(quantiteSang);
	    //convert to byte
	    Part filePart1 = req.getPart("ordonnance");
	    InputStream inputStream1 = null;
	    byte[] ordonnance = null;
	    if (filePart1 != null) {
	        inputStream1 = filePart1.getInputStream();
	        ByteArrayOutputStream output = new ByteArrayOutputStream();
	        byte[] buffer = new byte[1024];
	        for (int length = 0; (length = inputStream1.read(buffer)) > 0;) {
	            output.write(buffer, 0, length);
	        }
	        ordonnance = output.toByteArray();
	    }
	    System.out.println(sqlDate);
	    
	    System.out.println(parsedquantiteSang);
	    //retrieve email from session
	    HttpSession session = req.getSession();
	    String email = (String) session.getAttribute("email");
	    String cIN = "";
	    String statut="en cours de traitement";

	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    // retrieving the cIN from database
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
	        ps = con.prepareStatement("SELECT CIN FROM receveur WHERE email = ?");
	        ps.setString(1, email);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            cIN = rs.getString("CIN");
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (rs != null) rs.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    ReceveurDemande demande = new ReceveurDemande(cIN,hopital,sqlDate,maladie,parsedquantiteSang,ordonnance,statut);
	    //insert the request to database
	    try {
	    	ReceiverRequestDao receiverRequestDao = new ReceiverRequestDao();
			receiverRequestDao.insertRequest(demande);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        res.sendRedirect("Success.jsp");
	
	

		
		
		
		
	}
}


