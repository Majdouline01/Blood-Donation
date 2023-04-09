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
@WebServlet("/Receveur/changePwdR")
public class ChangeReceveurPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChangeReceveurPwdServlet() {

    }


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oldPwd = req.getParameter("oldPwd");
		String newPwd = req.getParameter("newPwd");
		
		HttpSession session = req.getSession();
		Receveur receveur =  (Receveur) session.getAttribute("receveur");
		
		ReceveurDao receveurDao = new ReceveurDao();
		
		
		if(receveurDao.changePwd(receveur.getcIN(), oldPwd, newPwd))
		{
			try {
			    req.getSession(false);
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
		}else 
			res.sendRedirect("ReceiverHomePage.jsp");
		
		
	}

}
