package Projet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Projet.DAO.DonateurDao;
import Projet.model.Donateur;

@WebServlet("/Donateur/updateDonateur")
public class UpadeDonateurInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;       
    public UpadeDonateurInfoServlet() {
    }
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String nomDonateur = req.getParameter("nomDonateur");
		String prenomDonateur = req.getParameter("prenomDonateur");
		String sexe = req.getParameter("sexe");
		String numTele = req.getParameter("numTele");
		String ville = req.getParameter("ville");	
		HttpSession session = req.getSession();
		Donateur d =  (Donateur) session.getAttribute("donateur");
		//String dateDeNaissanceStr = req.getParameter("dateDeNaissance");	
		Donateur donateur = new Donateur();		
		donateur = d;
		donateur.setcIN(d.getcIN());
		donateur.setNomDonateur(nomDonateur);
		donateur.setPrenomDonateur(prenomDonateur);
		donateur.setSexe(sexe);
		donateur.setNumTele(numTele);
		donateur.setVille(ville);	
		DonateurDao donateurDao = new DonateurDao();		
		if(donateurDao.updateDnateur(donateur))
		{
			session.setAttribute("donateur", donateur);
			res.sendRedirect("profilDonateur.jsp");
		}		
	}
}
