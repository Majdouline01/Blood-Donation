<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Projet.model.ReceveurDemande"%>
<%@ page import="java.util.Base64"%>
<%@ page import="Projet.DAO.DonationDao" %>
<%
 if (session.getAttribute("admin") == null) { 
   response.sendRedirect("signInAdmin.jsp");   
   return;
   }else {
	   DonationDao donationDao = new DonationDao();
	   ArrayList<ReceveurDemande> listDemandes = new ArrayList<ReceveurDemande>();
		 listDemandes = donationDao.getAllDemandesReceveur();
		 session.setAttribute("listDemandes", listDemandes);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demandes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
   <link rel="stylesheet" type="text/css" href="../demande.css">
   
   <style type="text/css">
   .content{
   	margin-top: 10%;
   }
   </style>
</head>
<body>
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
	<nav>
		<ul>
			<li><a href="profilAdmin.jsp">Profil</a></li>
			<li><a href="demandesDonateur.jsp">Demandes de Don</a></li>
			<li><a href="demandesReceveur.jsp"class="active">Demandes de reçu</a></li>
			<li><a href="statistics.jsp">Stats</a></li>
			<li>
				<form action="logoutAdmin" method="post">
					<a class="log-out"><button class="logout" type="submit"><i class='bx bx-log-out'></i></button></a>
				</form>
			</li>
		</ul>
	</nav>
</header>
	<c:set var="listDemandes" value="${sessionScope.listDemandes}" />
	<%ArrayList<ReceveurDemande> myList = (ArrayList<ReceveurDemande>) session.getAttribute("listDemandes");%>
	<table class="table content">
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>