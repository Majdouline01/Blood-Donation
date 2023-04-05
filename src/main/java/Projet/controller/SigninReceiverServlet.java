package Projet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Projet.DAO.AdminDao;
import Projet.DAO.DonateurDao;
import Projet.DAO.DonationDao;
import Projet.DAO.ReceveurDao;
import Projet.model.Demandes;
import Projet.model.Donateur;
import Projet.model.Receveur;
import Projet.model.ReceveurDemande;

@WebServlet("/Receveur/Connexion")
public class SigninReceiverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// get the data from the request
		
		

				
				String motDePasse = req.getParameter("motDePasse");
				String email = req.getParameter("email");
				//check if receiver is in database
				ReceveurDao receveurDao= new ReceveurDao();
				DonationDao donationDao = new DonationDao();
				Receveur receveur = receveurDao.CheckReceveur(email, motDePasse);
				ArrayList<ReceveurDemande> listDemandes = new ArrayList<ReceveurDemande>();
				 listDemandes = donationDao.getDemandesReceveur(receveur.getcIN());
				 
				 if (receveur != null) {
				     HttpSession session = req.getSession();
				     session.setAttribute("receveur", receveur);
				     session.setAttribute("email", email);
				     session.setAttribute("listDemandes", listDemandes);
				     res.sendRedirect("ReceiverHomePage.jsp");
				 } else {
				     res.getWriter().println("Invalid email or password. Please try again.");
				 }
			
	}

}
