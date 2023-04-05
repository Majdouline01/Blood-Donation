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

/**
 * Servlet implementation class AccepterDemandeReceveurServlet
 */
@WebServlet("/Admin/refuserDemandeDonateur")
public class RefuserDemandeDonateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefuserDemandeDonateurServlet() {
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String idString = req.getParameter("id");
		int idDemande = Integer.parseInt(idString);
		
		DonationDao donationDao = new DonationDao();
		AdminDao adminDao = new AdminDao();
		if(adminDao.refuserDemandeDonateur(idDemande)) {
			ArrayList<Demandes> listDemandesDonateur = new ArrayList<Demandes>();
			 listDemandesDonateur = donationDao.getAllDemandesDonateur();
			 HttpSession session = req.getSession();
			 session.setAttribute("listDemandesDonateur", listDemandesDonateur);
			res.sendRedirect("demandesDonateur.jsp");
		}//Add else section
			
		
		
		
		
		
	}

}
