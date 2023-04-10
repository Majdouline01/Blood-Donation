<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.ReceveurDemande" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.Receveur" %>
<%@ page import="Projet.DAO.DonationDao" %>
<%@ page import="Projet.DAO.ReceveurDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Mes demandes</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
 <link rel="stylesheet" type="text/css" href="../demande.css">
</head>
<body>
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
	<nav>
		<ul>
			<li><a href="ReceiverHomePage.jsp">Profil</a></li>
			<li><a href="MesDemandesReceveur.jsp" class="active">Mes Demandes</a></li>
			<li><a href="ReceiverRequest.jsp">Faire Demande</a></li>
			<li>
				<form action="logout" method="post">
					<a class="log-out"><button class="logout" type="submit"><i class='bx bx-log-out'></i></button></a>
				</form>
			</li>
		</ul>
	</nav>
	</header>
	<c:set var="receveur" value="${sessionScope.receveur}" />
	<c:set var="listDemandes" value="${sessionScope.listDemandes}" />
	<%
	ArrayList<ReceveurDemande> myList = (ArrayList<ReceveurDemande>) session.getAttribute("listDemandes");
	%>
	<table class="table">
		<thead>
			<tr>
				<th>CIN</th>
				<th>HOPITAL</th>
				<th>DATE</th>
				<th>MALADIE</th>
				<th>STATUT</th>
			</tr>
		</thead>
		<tbody>
		<% int statut; %>
			<%
			for (ReceveurDemande myObject : myList) {
				statut = myObject.getStatut();
			%>
			<tr>
				<td><%=myObject.getcIN()%></td>
				<td><%=myObject.getHopital()%></td>
				<td><%=myObject.getDate()%></td>
				<td><%=myObject.getMaladie()%></td>
				<td>
					<% if (statut == 0) { %>
                    <span class="badge bg-warning">En cours de traitement</span>
                <% } else { %>
                    <span class="badge bg-success">Validée</span>
                <% } %>
				</td>
				
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	
	
</body>
</html>