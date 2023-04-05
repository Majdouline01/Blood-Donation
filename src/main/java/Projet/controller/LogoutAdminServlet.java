package Projet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutAdminServlet
 */
@WebServlet("/Admin/logoutAdmin")
public class LogoutAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LogoutAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		    HttpSession session = req.getSession(false);
		    if (session != null) {
		        session.invalidate();
		        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		        res.setHeader("Pragma", "no-cache");
		        res.setHeader("Expires", "0");
		    }
		    res.sendRedirect("signInAdmin.jsp");
		} catch (Exception e) {
		    // Handle the exception
		    e.printStackTrace();
		}
	}

}
