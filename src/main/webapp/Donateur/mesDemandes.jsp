<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Projet.model.Demandes"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<ul>
			<li><a href="profilDonateur.jsp">Profil</a></li>
			<li><a href="mesDemandes.jsp">Mes Demandes</a></li>
			<li><a href="#">Faire Demande</a></li>
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
	${listDemandes[0].getDateDemande()}

	<table>
		<thead>
			<tr>
				<th>CIN</th>
				<th>DATE</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Demandes> demandesList = (List<Demandes>) request.getAttribute("listDemandes");
			if (demandesList != null) {
				for (int i = 0; i < demandesList.size(); i++) {
					Demandes demande = demandesList.get(i);
			%>
			<tr>
				<td>${demande.getCIN()}</td>
				<td>${demande.getDateDemande()}</td>
			</tr>
			<%
			}
			}
			%>

		</tbody>
	</table>


</body>
</html>