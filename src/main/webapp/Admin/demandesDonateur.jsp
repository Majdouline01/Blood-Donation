<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.ReceveurDemande" %>
<%@ page import="Projet.model.Demandes" %>
<%@ page import="Projet.DAO.DonationDao" %>
<%
 if (session.getAttribute("admin") == null) { 
   response.sendRedirect("signInAdmin.jsp");
   return;
   }else {
	   DonationDao donationDao = new DonationDao();
	   ArrayList<Demandes> listDemandesDonateur = new ArrayList<Demandes>();
		 listDemandesDonateur = donationDao.getAllDemandesDonateur();
		 session.setAttribute("listDemandesDonateur", listDemandesDonateur);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
   <link rel="stylesheet" type="text/css" href="../demande2.css">
</head>
<body>
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
<nav>
		<ul>
			<li><a href="profilAdmin.jsp" id="M">Profil</a></li>
			<li><a href="demandesDonateur.jsp" class="active" id="M">Demandes de Don</a></li>
			<li><a href="demandesReceveur.jsp" id="M">Demandes de recu</a></li>
			<li><a href="statistics.jsp" id="M">Stats</a></li>
			<li>
				<form action="logoutAdmin" method="post">
					<a class="log-out"><button class="logout" type="submit"><i class='bx bx-log-out'></i></button></a>
				</form>
			</li>
		</ul>
	</nav>
</header>
	<c:set var="listDemandes" value="${sessionScope.listDemandesDonateur}" />
	<%ArrayList<Demandes> myList = (ArrayList<Demandes>) session.getAttribute("listDemandesDonateur");%>
	<table class="table" id="Table">
		<thead>
			<tr>
				<th>ID</th>
				<th>CIN</th>
				<th>DATE</th>
				<th colspan="2">ACTION</th>
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
               	</td>
               	<td>
               	<form action="refuserDemandeDonateur" method="post">
                        <input type="hidden" name="id" value="<%=myObject.getId()%>"/>
                        <button type="submit" class="btn btn-danger">Refuser</button>
               	</form>	
               	
               	</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>