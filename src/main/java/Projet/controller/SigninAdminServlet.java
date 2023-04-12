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
import Projet.DAO.ReceiverRequestDao;
import Projet.DAO.StockDao;
import Projet.model.Admin;
import Projet.model.Demandes;
import Projet.model.Donateur;
import Projet.model.ReceveurDemande;
import Projet.model.Stock;


@WebServlet("/Admin/loginAdmin")
public class SigninAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SigninAdminServlet() {
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
				
		
		// get the data from the request
				String motDePasse = req.getParameter("motDePasse");
				String email = req.getParameter("email");
				//check if admin is in database
				 AdminDao adminDao= new AdminDao();
				 Admin admin = adminDao.CheckAdmin(email, motDePasse);
				 
				 
				 
				 boolean error = false;
				 
				 if (admin != null) {
					 DonationDao donationDao = new DonationDao();
					 ArrayList<ReceveurDemande> listDemandes = new ArrayList<ReceveurDemande>();
					 listDemandes = donationDao.getAllDemandesReceveur();
					 
					 ArrayList<Demandes> listDemandesDonateur = new ArrayList<Demandes>();
					 listDemandesDonateur = donationDao.getAllDemandesDonateur();
					 
					 StockDao stockDao = new StockDao();
					 ArrayList<Stock> stocks = new ArrayList<>();
					 stocks = stockDao.getStockStats();
					 			 	
					 adminDao.deleteOldDemandes();
				     HttpSession session = req.getSession();
				     session.setAttribute("admin", admin);
				     session.setAttribute("email", email);
				     session.setAttribute("listDemandes", listDemandes);
				     session.setAttribute("listDemandesDonateur", listDemandesDonateur);
				     session.setAttribute("stocks", stocks);
				     res.sendRedirect("profilAdmin.jsp");
				     
				     //System.out.print(listDemandes.get(0).getCIN());
				 } else {
					 error = true;
					 HttpSession session = req.getSession();
					 session.setAttribute("error", error);
					 res.sendRedirect("signInAdmin.jsp");
				 }
			
	}

}
