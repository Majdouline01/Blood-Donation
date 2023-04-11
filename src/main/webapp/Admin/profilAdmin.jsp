<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 if (session.getAttribute("admin") == null) { 
   response.sendRedirect("signInAdmin.jsp");
   return;
   }	   
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
    integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYlF/xIch/wEp/0RrjyDWSAzUxt2I7MhJ" 
    crossorigin="anonymous">
    <link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" type="text/css" href="../Profil.css">
</head>
<body>
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
<nav>
		<ul>
			<li><a href="profilAdmin.jsp" class="active" id="M">Profil</a></li>
			<li><a href="demandesDonateur.jsp" id="M">Demandes de Don</a></li>
			<li><a href="demandesReceveur.jsp" id="M">Demandes de recu</a></li>
			<li><a href="statistics.jsp" id="M">Stats</a></li>
			<li>
				<form action="logoutAdmin" method="post">
					<a class="log-out" id="N"><button class="logout" type="submit" ><i class='bx bx-log-out'></i></button></a>
				</form>
			</li>
		</ul>
	</nav>
	</header>
<c:set var="admin" value="${sessionScope.admin}" />                                    
	       Bienvenue, ${admin.prenomAdmin}!
	       
	       <div class="container">
        <h1>Informations de l'admin</h1>
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th>Nom</th>
                    <td>${admin.nomAdmin}</td>
                </tr>
                <tr>
                    <th>Prénom</th>
                    <td>${admin.prenomAdmin}</td>
                </tr>
                <tr>
                    <th>Numéro de téléphone</th>
                    <td>${admin.numTele}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>