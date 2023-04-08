<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Projet.model.ReceveurDemande"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<nav>
		<ul>
			<li><a href="profilAdmin.jsp">Profil</a></li>
			<li><a href="demandesDonateur.jsp">Demandes de Don</a></li>
			<li><a href="demandesReceveur.jsp">Demandes de recu</a></li>
			<li><a href="statistics.jsp">Stats</a></li>
			<li>
				<form action="logoutAdmin" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	<c:set var="listDemandes" value="${sessionScope.listDemandes}" />

	<%
	ArrayList<ReceveurDemande> myList = (ArrayList<ReceveurDemande>) session.getAttribute("listDemandes");
	%>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>CIN</th>
				<th>HOSPITAL</th>
				<th>DATE</th>
				<th>MALADIE</th>
				<th>QUANTITE</th>
				<th>ORDONNANCE</th>
				<th>ACTION</th>
				<th>TELECHARGER</th>
			</tr>
		</thead>
		<tbody>
			<%
			int statut;
			%>
			<%
			for (ReceveurDemande myObject : myList) {
				statut = myObject.getStatut();
			%>
			<tr>
				<td><%=myObject.getId()%></td>
				<td><%=myObject.getcIN()%></td>
				<td><%=myObject.getHopital()%></td>
				<td><%=myObject.getDate()%></td>
				<td><%=myObject.getMaladie()%></td>
				<td><%=myObject.getQuantiteSang()%></td>
				<td><%=myObject.getOrdonnance()%></td>

				</td>
				<td>

					<form action="accepterDemandeReceveur" method="post">
						<input type="hidden" name="id" value="<%=myObject.getId()%>" />
						<button type="submit" class="btn btn-success">Valider</button>
					</form>
					<form action="refuserDemandeReceveur" method="post">
						<input type="hidden" name="id" value="<%=myObject.getId()%>" />
						<button type="submit" class="btn btn-danger">Refuser</button>
					</form>
				</td>
				<td>
					<%
					byte[] fileContent = myObject.getOrdonnanceFile();
					if (fileContent != null && fileContent.length > 0) {
						String encodedData = Base64.getEncoder().encodeToString(fileContent);
						String mimeType = "application/pdf"; // Change this to the correct MIME type for your file
						String fileName = "ordonnance.pdf"; // Change this to the correct file name
						String dataUri = "data:" + mimeType + ";base64," + encodedData;
					%> <a href="<%=dataUri%>" download="<%=fileName%>">Télécharger</a>
					<%
					}
					%>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>