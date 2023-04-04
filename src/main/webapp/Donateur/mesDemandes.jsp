<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.Demandes" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes demandes</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<nav>
		<ul>
			<li><a href="profilDonateur.jsp">Profil</a></li>
			<li><a href="mesDemandes.jsp">Mes Demandes</a></li>
			<li><a href="Donation.jsp">Faire Demande</a></li>
			<li>
				<form action="test" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	
	
	
	<c:set var="donateur" value="${sessionScope.donateur}" />
	<c:set var="listDemandes" value="${sessionScope.listDemandes}" />

	Welcome, ${donateur.prenomDonateur}! ${listDemandes[0].getCIN()}


	<%
	ArrayList<Demandes> myList = (ArrayList<Demandes>) session.getAttribute("listDemandes");
	%>
	<table class="table">
		<thead>
			<tr>
				<th>CIN</th>
				<th>DATE</th>
				<th>STATE</th>
			</tr>
		</thead>
		<tbody>
		<% int isValidated; %>
			<%
			for (Demandes myObject : myList) {
				isValidated = myObject.getIsValidated();
			%>
			<tr>
				<td><%=myObject.getCIN()%></td>
				<td><%=myObject.getDateDemande()%></td>
				<td>
					<% if (isValidated == 0 ) { %>
                    <span class="badge bg-warning">En cours de traitement</span>
                <% } else { %>
                    <span class="badge bg-success">Succes</span>
                <% } %>
				</td>
				
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>
