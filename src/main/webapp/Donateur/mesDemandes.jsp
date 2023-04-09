<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.Demandes" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
* {
    margin: 0;
    padding: 0;
    font-family: 'Ubuntu', sans-serif;
  }
  
  body {
    display: flex;
    flex-direction: column;
    width: 100%;
    min-height: 100vh;
    align-items: center;
    justify-content: center;
    background: linear-gradient(45deg, rgba(90, 61, 61, 0.5), rgba(112, 150, 174, 0.7));
    background-size: cover;
    background-position: center;
  }
  
  header {
    position: fixed;
    top: 0;
    left: 0;
    width: 90%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2.5rem;
    z-index: 999;
    background-color: transparent;
    transition: all 0.3s ease;
  }
  
  header .logo {
    color: #fff;
    font-size: 2rem;
  }
  
  header nav {
    display: flex;
    align-items: center;
  }
  
  header nav ul {
    list-style: none;
    display: flex;
    align-items: center;
    font-size: 20px ;
  }
  
  header nav ul li {
    margin-left: 1rem;
  }
  header nav ul li a.active {
    background-color: rgba(255, 255, 255, 0.2);
  }
  header nav ul li a {
    color: #fff;
    text-decoration: none;
    font-size: 1rem;
    transition: all 0.3s ease;
    padding: 0.5rem 2.5rem;
    border-radius: 0.5rem;
  }
  
  header nav ul li a:hover {
    background-color: rgba(255, 255, 255, 0.2);
  }
  i {
    font-size:150%;
    align-items: center;
  }
</style>
<meta charset="UTF-8">
<title>Mes demandes</title>
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
	<nav>
		<ul>
			<li><a href="profilDonateur.jsp">Profil</a></li>
			<li><a href="mesDemandes.jsp">Mes Demandes</a></li>
			<li><a href="Donation.jsp">Faire Demande</a></li>
			<li>
				<form action="test" method="post">
					<a><i class='bx bx-log-out'></i></a>
				</form>
			</li>
		</ul>
	</nav>
	</header>
	
	
	
	<c:set var="donateur" value="${sessionScope.donateur}" />
	<c:set var="listDemandes" value="${sessionScope.listDemandes}" />



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
                    <span class="badge bg-warning">etat 0</span>
                <% } else if (isValidated == 1 ){ %>
                    <span class="badge bg-success">etat 1</span>
                <% } else if (isValidated == 2 ){ %>
                	<span class="badge bg-success">etat 2</span>
                	<% } else if (isValidated == -1 ){ %>
                	<span class="badge bg-success">etat -1</span>
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
