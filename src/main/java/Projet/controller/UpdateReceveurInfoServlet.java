package Projet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Projet.DAO.DonateurDao;
import Projet.DAO.ReceveurDao;
import Projet.model.Donateur;
import Projet.model.Receveur;

/**
 * Servlet implementation class UpadeDonateurInfoServlet
 */
@WebServlet("/Receveur/updateReceveur")
public class UpdateReceveurInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateReceveurInfoServlet() {

    }


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nomReceveur = req.getParameter("nomReceveur");
		String prenomReceveur = req.getParameter("prenomReceveur");
		String ville = req.getParameter("ville");
		String numTele = req.getParameter("numTele");

		
		HttpSession session = req.getSession();
		Receveur r =  (Receveur) session.getAttribute("receveur");
		//String dateDeNaissanceStr = req.getParameter("dateDeNaissance");
		
		Receveur receveur = new Receveur();
		
		receveur = r;
		receveur.setcIN(r.getcIN());
		receveur.setPrenomReceveur(prenomReceveur);
		receveur.setNomReceveur(nomReceveur);
		receveur.setVille(ville);
		receveur.setNumTele(numTele);
		

		ReceveurDao receveurDao = new ReceveurDao();
		
		if(receveurDao.updateReceveur(receveur))
		{
			session.setAttribute("receveur", receveur);
			res.sendRedirect("ReceiverHomePage.jsp");
		}
		
		
	}

}
