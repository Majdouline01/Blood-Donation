package Projet.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Projet.DAO.DonateurDao;
import Projet.model.Donateur;

@WebServlet("/Donateur/s'inscrire")
public class SignUpDonateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		// Get form data from request
		String nomDonateur = req.getParameter("nomDonateur");
		String prenomDonateur = req.getParameter("prenomDonateur");
		String cIN = req.getParameter("cIN");
		String sexe = req.getParameter("sexe");
		String numTele = req.getParameter("numTele");
		String ville = req.getParameter("ville");
		String dateDeNaissanceStr = req.getParameter("dateDeNaissance");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = null;
		try {
			utilDate = sdf.parse(dateDeNaissanceStr);
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		String motDePasse = req.getParameter("motDePasse");
		String email = req.getParameter("email");
		String groupage = req.getParameter("groupage");
		System.out.println(cIN);
		// Create a new donator object with the form data
	    Donateur newDonateur = new  Donateur(cIN, nomDonateur, prenomDonateur, sexe, ville, groupage,
	    		sqlDate, numTele, email, motDePasse);
	    
	    //--------------------------------
	    //--------------------------------
	    // call the method to fill all the questions
	    //--------------------------------
	 // Create a DonatorDao instance and use its insertdonator method to save the new donator to the database
	    DonateurDao donatorDao= new DonateurDao();
	    try {
			donatorDao.insertDonteur(newDonateur);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  
	    res.sendRedirect("signInDonateur.jsp");
	}
	

}
