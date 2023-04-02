package Projet.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Projet.DAO.DonateurDao;
import Projet.model.Donateur;


@WebServlet("/Donateur/test")
public class LogoutDonateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
		    HttpSession session = req.getSession(false);
		    if (session != null) {
		    	Cookie[] cookies = req.getCookies();
		    	if (cookies != null) {
		    	    for (Cookie cookie : cookies) {
		    	        cookie.setValue("");
		    	        cookie.setPath("/");
		    	        cookie.setMaxAge(0);
		    	        res.addCookie(cookie);
		    	    }
		    	}
		        session.invalidate();
		    }
		    res.sendRedirect("signInDonateur.jsp");
		} catch (Exception e) {
		    // Handle the exception
		    e.printStackTrace();
		}



		

}
}