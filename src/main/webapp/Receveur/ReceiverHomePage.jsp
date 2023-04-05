<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page d'acceuil</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
    integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYlF/xIch/wEp/0RrjyDWSAzUxt2I7MhJ" 
    crossorigin="anonymous">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi4h1HM" 
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" 
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" 
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" 
    integrity="sha384-Wsk5IB+IQRgdeLhBE1a5G39J36ysw7jKASxLBiAdGNEFgyeLyKp0Ff5q5tocn+i6" 
    crossorigin="anonymous"></script>
	<nav>
		<ul>
			<li><a href="ReceiverHomePage.jsp">Profil</a></li>
			<li><a href="MesDemandesReceveur.jsp">Mes Demandes</a></li>
			<li><a href="ReceiverRequest.jsp">Faire Demande</a></li>
			<li>
				<form action="logout" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	<c:set var="receveur" value="${sessionScope.receveur}" />
	Welcome, ${receveur.prenomReceveur}!
	
	<div class="container">
        <h1>Person Information</h1>
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th>Name</th>
                    <td>${receveur.nomReceveur}</td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td>${receveur.prenomReceveur}</td>
                </tr>
                <tr>
                    <th>Sex</th>
                    <td>${receveur.sexe}</td>
                </tr>
                <tr>
                    <th>City</th>
                    <td>${receveur.ville}</td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td>${receveur.groupage}</td>
                </tr>
                <tr>
                    <th>Birth Year</th>
                    <td>${receveur.dateDeNaissance}</td>
                </tr>
                <tr>
                    <th>Blood Groupage</th>
                    <td>${receveur.email}</td>
                </tr>
            </tbody>
        </table>
    </div>
    

</body>
</html>