<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.Demandes" %>
<%@ page import="Projet.model.Donateur" %>
<%@ page import="Projet.DAO.DonationDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 if (session.getAttribute("donateur") == null) { 
   response.sendRedirect("signInDonateur.jsp");
   return;
   }else {
	   Donateur donateur = new Donateur();
	 	donateur = (Donateur) session.getAttribute("donateur");
	    DonationDao donationDao = new DonationDao();
	    ArrayList<Demandes> listDemandes = new ArrayList<Demandes>();
		listDemandes = donationDao.getDemandes(donateur.getcIN());
		session.setAttribute("listDemandes", listDemandes);
   }	   
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Mes demandes</title>
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
   <link rel="stylesheet" type="text/css" href="../demande.css">
  
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
	<nav>
		<ul>
			<li><a href="profilDonateur.jsp" id="M">Profil</a></li>
			<li><a href="mesDemandes.jsp" class="active" id="M">Mes Demandes</a></li>
			<li><a href="test.jsp" id="M">Faire Demande</a></li>
			<li>
				<form action="test" method="post">
				<a class="log-out" id="N"><button class="logout" type="submit" ><i class='bx bx-log-out'></i></button></a>
				</form>
			</li>
		</ul>
	</nav>
	</header>
	<c:set var="donateur" value="${sessionScope.donateur}" />
	<c:set var="listDemandes" value="${sessionScope.listDemandes}" />
	<%ArrayList<Demandes> myList = (ArrayList<Demandes>) session.getAttribute("listDemandes");%>
	<table class="table">
		<thead>
			<tr>
				<th>CIN</th>
				<th>DATE</th>
				<th>Etat</th>
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
                    <span class="badge bg-warning">En attente</span>
                <% } else if (isValidated == 1 ){ %>
                    <span class="badge bg-success">Validée</span>
                <% } else if (isValidated == 2 ){ %>
                	<span class="badge bg-success">Bénéficiée</span>
                	<% } else if (isValidated == -1 ){ %>
                	<span class="badge bg-success">Refusée</span>
                	<%} %>
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
