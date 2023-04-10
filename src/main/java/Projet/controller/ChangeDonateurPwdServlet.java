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
@WebServlet("/Donateur/changePwd")
public class ChangeDonateurPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ChangeDonateurPwdServlet() {
    }
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String oldPwd = req.getParameter("oldPwd");
		String newPwd = req.getParameter("newPwd");	
		HttpSession session = req.getSession();
		Donateur donateur =  (Donateur) session.getAttribute("donateur");
		DonateurDao donateurDao = new DonateurDao();
		boolean error = false;
		if(donateurDao.changePwd(donateur.getcIN(), oldPwd, newPwd))
		{
			try {
			    req.getSession(false);
			    if (session != null) {
			        session.invalidate();
			        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			        res.setHeader("Pragma", "no-cache");
			        res.setHeader("Expires", "0");
			    }
			    res.sendRedirect("signInDonateur.jsp");
			} catch (Exception e) {
			    // Handle the exception
			    e.printStackTrace();
			}
		}else {
			error = true;
			session = req.getSession();
			 session.setAttribute("error", error);
				res.sendRedirect("changePWD.jsp");
		}		
	}
}
