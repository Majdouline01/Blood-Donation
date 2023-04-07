package Projet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Projet.DAO.DonationDao;
import Projet.DAO.StockDao;
import Projet.model.ReceveurDemande;

@WebServlet("/Admin/accepterDemandeReceveur")
public class AccepterDemandeReceveurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AccepterDemandeReceveurServlet() {
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String idString = req.getParameter("id");
		int idDemande = Integer.parseInt(idString);
		
		DonationDao donationDao = new DonationDao();
		StockDao stockDao = new StockDao();
		if(stockDao.AccepterDemandeReceveur(idDemande)) {
			if(donationDao.accepterDemandeReceveur(idDemande)) {
				ArrayList<ReceveurDemande> listDemandes = new ArrayList<ReceveurDemande>();
				 listDemandes = donationDao.getAllDemandesReceveur();
				 HttpSession session = req.getSession();
				 session.setAttribute("listDemandes", listDemandes);
				res.sendRedirect("demandesReceveur.jsp");
			}else res.sendRedirect("../errorPage.jsp");
		}else res.sendRedirect("../errorPage.jsp");
			
		
			
		
		
		
		
		
	}

}
