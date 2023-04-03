package Projet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Projet.DAO.DonationDao;
import Projet.model.Demandes;


@WebServlet("/Donateur/donate")
public class DonationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	   //retrieve data from request
		String dateStr = req.getParameter("date");
		//System.out.print(dateStr);
		
		//convert date from 04/20/2023 to 2023-04-19 FORMAT------
		String[] str = dateStr.split("/");
		dateStr = "";
		dateStr = str[2] + "-" + str[0] + "-" + str[1];
		//System.out.print(dateStr);
		//-------------------------------------------------------
		
		
		
		
	    Date date = Date.valueOf(dateStr);
       //initialize 
	    boolean isAvailable = false;
	    //check if the date is available 
	    try {
	        isAvailable = DonationDao.isDateAvailable(date);
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	    //if the date is available
	    if (isAvailable) {
	    	//retrieve the email from the session
	    	HttpSession session = req.getSession();
	    	String email = (String) session.getAttribute("email");
	        String cIN = "";
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        // retrieving the cIN from database
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
	            ps = con.prepareStatement("SELECT CIN FROM donateur WHERE email = ?");
	            ps.setString(1, email);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	                cIN = rs.getString("CIN");
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        
	        Demandes demande = new Demandes(cIN, date);
	        //insert the date to data base and
	        try {
	            DonationDao.insertDate(demande);
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }

	        //res.sendRedirect("Success.jsp");
	        System.out.print("hello");
	        res.setContentType("text/plain");
		    res.setCharacterEncoding("UTF-8");
		    res.getWriter().write("success");
		    System.out.print("hello2");
	    } else {
	       
	        res.sendRedirect("NotAvailable.jsp");
	    }
	    
	    
	    
	}
}

