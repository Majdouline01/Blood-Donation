package Projet.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Projet.DAO.ReceveurDao;

import Projet.model.Receveur;


@WebServlet("/Receveur/S'inscrire")
public class SignUpReceiverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		// Get form data from request
				String nomReceveur = req.getParameter("nomReceveur");
				String prenomReceveur = req.getParameter("prenomReceveur");
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
				String quantiteSang = req.getParameter("quantiteSang");
				float parsedquantiteSang = Float.parseFloat(quantiteSang);
				// Create a new receiver object with the form data
				Receveur newReceveur = new  Receveur(cIN, nomReceveur, prenomReceveur, sexe, ville, groupage,
			    		sqlDate, numTele, email, motDePasse,parsedquantiteSang);
	    		 // Create a ReceveurDao instance and use its insertreceveur method to save the new receiver to the database
	    		ReceveurDao receveurDao= new ReceveurDao();
	    		    try {
	    		    	receveurDao.insertReceveur(newReceveur);
	    			} catch (SQLException e) {
	    				e.printStackTrace();
	    			}
	    		    res.sendRedirect("SignInReceveur.jsp");
	}

}
