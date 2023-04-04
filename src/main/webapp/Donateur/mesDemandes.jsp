<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.Demandes" %>
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


	<%
	ArrayList<Demandes> myList = (ArrayList<Demandes>) session.getAttribute("listDemandes");
	%>
	<table>
		<thead>
			<tr>
				<th>CIN</th>
				<th>DATE</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Demandes myObject : myList) {
			%>
			<tr>
				<td><%=myObject.getCIN()%></td>
				<td><%=myObject.getDateDemande()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>


</body>
</html>
