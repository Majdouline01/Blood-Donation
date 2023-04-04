package Projet.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Projet.DAO.DonateurDao;
import Projet.DAO.DonationDao;
import Projet.model.Demandes;
import Projet.model.Donateur;


@WebServlet("/Donateur/connexion")
public class SigninDonatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// get the data from the request
		String motDePasse = req.getParameter("motDePasse");
		String email = req.getParameter("email");
		//check if donateur is in database
		 DonateurDao donatorDao= new DonateurDao();
		 DonationDao donationDao = new DonationDao();
		 Donateur donateur = donatorDao.CheckDonateur(email, motDePasse);
		 
		 ArrayList<Demandes> listDemandes = new ArrayList<Demandes>();
		 listDemandes = donationDao.getDemandes(donateur.getcIN());
		 //String test = "test";
		 
		 if (donateur != null) {
		     HttpSession session = req.getSession();
		     session.setAttribute("donateur", donateur);
		     session.setAttribute("email", email);
		     session.setAttribute("listDemandes", listDemandes);
		     res.sendRedirect("profilDonateur.jsp");
		     
		     //System.out.print(listDemandes.get(0).getCIN());
		 } else {
		     res.getWriter().println("Invalid email or password. Please try again.");
		 }
	
	}

}
