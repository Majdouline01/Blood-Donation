package login;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//System.out.print("test");
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM user where id=2");
			while (rs.next()) {
			    String name = rs.getString("nom");
			    System.out.print(name);
			    	
			}
			conn.close();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		String AdminName = req.getParameter("AdminName");
		String password = req.getParameter("password");
		if (AdminName.equals("admin") && password.equals("admin123")) {
			HttpSession session = req.getSession();
			session.setAttribute("AdminName", AdminName);
			res.sendRedirect("home.jsp");
		} else {
			req.setAttribute("errorMessage", "Invalid AdminName or password");
			req.getRequestDispatcher("Login.jsp").forward(req, res);
			
	}
	}
}
