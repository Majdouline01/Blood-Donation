<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.ReceveurDemande" %>
<%@ page import="Projet.model.Receveur" %>
<%@ page import="Projet.DAO.DonationDao" %>
<%@ page import="Projet.DAO.ReceveurDao" %>
<%
 if (session.getAttribute("receveur") == null) { 
   response.sendRedirect("SignInReceveur.jsp");
   
   return;
   }else {
	   ReceveurDao receveurDao= new ReceveurDao();
		DonationDao donationDao = new DonationDao();
		Receveur receveur = new Receveur();
		receveur = (Receveur) session.getAttribute("receveur");
		ArrayList<ReceveurDemande> listDemandes = new ArrayList<ReceveurDemande>();
		 listDemandes = donationDao.getDemandesReceveur(receveur.getcIN());
		 session.setAttribute("listDemandes", listDemandes);

   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Changer Mot de passe</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<c:set var="error" value="${sessionScope.error}" />
<nav>
		<ul>
			<li><a href="ReceiverHomePage.jsp" class="active">Profil</a></li>
			<li><a href="MesDemandesReceveur.jsp">Mes Demandes</a></li>
			<li><a href="ReceiverRequest.jsp">Faire Demande</a></li>
			<li>
				<form action="logout" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	<form action="changePwdR" method="post">
		Old Password<input name="oldPwd" type="password">
		<c:if test="${error == true}">
   								<span class="text-danger">Invalid password</span>
   								<%
    								session.removeAttribute("error");
								%>
							</c:if>
          <div class="button-area">
		New Password<input name="newPwd" type="password">
		Confirm Password<input type="password">
		<input type="submit">
	</form>
</body>
</html>