package Projet.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/Receveur/logout")
public class LogoutReceveurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
		    HttpSession session = req.getSession(false);
		    if (session != null) {
		        session.invalidate();
		        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		        res.setHeader("Pragma", "no-cache");
		        res.setHeader("Expires", "0");
		    }
		    res.sendRedirect("SignInReceveur.jsp");
		} catch (Exception e) {
		    // Handle the exception
		    e.printStackTrace();
		}



		

}
}