<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.ReceveurDemande" %>
<%@ page import="Projet.model.Demandes" %>

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
			<li><a href="profilAdmin.jsp">Profil</a></li>
			<li><a href="demandesDonateur.jsp">Demandes de Don</a></li>
			<li><a href="demandesReceveur.jsp">Demandes de recu</a></li>
			<li>
				<form action="logoutAdmin" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	<c:set var="listDemandes" value="${sessionScope.listDemandesDonateur}" />
	
	<%
	ArrayList<Demandes> myList = (ArrayList<Demandes>) session.getAttribute("listDemandesDonateur");
	%>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>CIN</th>
				<th>DATE</th>
				<th>ACTION</th>
			</tr>
		</thead>
		<tbody>
		<% int isValidated; %>
			<%
			for (Demandes myObject : myList) {
				isValidated = myObject.getIsValidated();
			%>
			<tr>
				<td><%=myObject.getId()%></td>
				<td><%=myObject.getCIN()%></td>
				<td><%=myObject.getDateDemande()%></td>
				<td>
				
				<form action="accepterDemandeDonateur" method="post">
                        <input type="hidden" name="id" value="<%=myObject.getId()%>"/>
                        <button type="submit" class="btn btn-success">Valider</button>
               	</form>
               	<form action="refuserDemandeDonateur" method="post">
                        <input type="hidden" name="id" value="<%=myObject.getId()%>"/>
                        <button type="submit" class="btn btn-danger">Refuser</button>
               	</form>
				
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>