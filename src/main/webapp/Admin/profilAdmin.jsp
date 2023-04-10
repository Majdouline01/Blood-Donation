<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<li><a href="profilAdmin.jsp" class="active">Profil</a></li>
			<li><a href="demandesDonateur.jsp">Demandes de Don</a></li>
			<li><a href="demandesReceveur.jsp">Demandes de recu</a></li>
			<li><a href="statistics.jsp">Stats</a></li>
			<li>
				<form action="logoutAdmin" method="post">
					<a class="log-out"><button class="logout" type="submit"><i class='bx bx-log-out'></i></button></a>>
				</form>
			</li>
		</ul>
	</nav>
	</header>
<c:set var="admin" value="${sessionScope.admin}" />                                    
	       Welcome, ${admin.prenomAdmin}!
	       
	       <div class="container">
        <h1>Person Information</h1>
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th>Name</th>
                    <td>${admin.nomAdmin}</td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td>${admin.prenomAdmin}</td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td>${admin.numTele}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>