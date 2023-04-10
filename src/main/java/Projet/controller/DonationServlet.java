package Projet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Projet.DAO.DonationDao;
import Projet.DAO.StockDao;
import Projet.model.Demandes;
import Projet.model.Donateur;


@WebServlet("/Donateur/donate")
public class DonationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	   //retrieve data from request
		String dateStr = req.getParameter("date");
		//convert date from 04/20/2023 to 2023-04-19 FORMAT------
		String[] str = dateStr.split("/");
		dateStr = "";
		dateStr = str[2] + "-" + str[0] + "-" + str[1];
	    Date date = Date.valueOf(dateStr);
	    HttpSession session = req.getSession();
    	Donateur donateur = (Donateur) session.getAttribute("donateur");
    	String cin = donateur.getcIN();
	    boolean isAvailable = false;
	    //check if the date is available 
	    try {
	        isAvailable = DonationDao.isDateAvailable(date, donateur.getcIN());
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	    //if the date is available
	    if (isAvailable) {
	        StockDao stockDao = new StockDao();
	        int type = 0;
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetfinetude", "root", "");
	            ps = con.prepareStatement("SELECT * FROM donateur WHERE CIN = ?");
	            ps.setString(1, cin);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	                type = stockDao.getBloodId(rs.getString("groupage"));
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
	        
	        Demandes demande = new Demandes(cin, date);
	        demande.setType(type);
	        //insert the date to data base and
	        try {
	            DonationDao.insertDate(demande);
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }
	        res.setContentType("text/plain");
		    res.setCharacterEncoding("UTF-8");
		    res.getWriter().write("success");
		    //to refresh the demandes list
		    DonationDao donationDao = new DonationDao();
		    ArrayList<Demandes> listDemandes = new ArrayList<Demandes>();
			listDemandes = donationDao.getDemandes(cin);
			session.setAttribute("listDemandes", listDemandes);		 
	    } else {
	       
	        res.sendRedirect("NotAvailable.jsp");
	    }    
	}
}

