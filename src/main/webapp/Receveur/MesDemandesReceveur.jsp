<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.ReceveurDemande" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<nav>
		<ul>
			<li><a href="ReceiverHomePage.jsp">Profil</a></li>
			<li><a href="MesDemandesReceveur.jsp">Mes Demandes</a></li>
			<li><a href="ReceiverRequest.jsp">Faire Demande</a></li>
			<li>
				<form action="logout" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	<c:set var="receveur" value="${sessionScope.receveur}" />
	<c:set var="listDemandes" value="${sessionScope.listDemandes}" />
	Welcome, ${receveur.prenomReceveur}!
	
	<%
	ArrayList<ReceveurDemande> myList = (ArrayList<ReceveurDemande>) session.getAttribute("listDemandes");
	%>
	<table class="table">
		<thead>
			<tr>
				<th>CIN</th>
				<th>HOSPITAL</th>
				<th>DATE</th>
				<th>MALADIE</th>
				<th>STATUT</th>
			</tr>
		</thead>
		<tbody>
		<% String statut; %>
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
					<% if (statut == "") { %>
                    <span class="badge bg-warning">En cours de traitement</span>
                <% } else { %>
                    <span class="badge bg-success">Success</span>
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