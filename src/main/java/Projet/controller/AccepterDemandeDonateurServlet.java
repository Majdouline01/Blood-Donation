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
import Projet.DAO.DonationDao;
import Projet.model.Demandes;
import Projet.model.ReceveurDemande;

@WebServlet("/Admin/accepterDemandeDonateur")
public class AccepterDemandeDonateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AccepterDemandeDonateurServlet() {
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String idString = req.getParameter("id");
		int idDemande = Integer.parseInt(idString);
		
		DonationDao donationDao = new DonationDao();
		AdminDao adminDao = new AdminDao();
		if(adminDao.accepterDemandeDonateur(idDemande)) {
			ArrayList<Demandes> listDemandesDonateur = new ArrayList<Demandes>();
			 listDemandesDonateur = donationDao.getAllDemandesDonateur();
			 HttpSession session = req.getSession();
			 session.setAttribute("listDemandesDonateur", listDemandesDonateur);
			res.sendRedirect("demandesDonateur.jsp");
		}//Add else section
			
		
		
		
		
		
	}

}
