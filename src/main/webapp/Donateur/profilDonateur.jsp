<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profil</title>
<link rel="stylesheet" type="text/css" href="../css.css">
<style>
/* CSS for the table */
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}
</style>
</head>
<body>
	<nav>
		<ul>
			<li><a href="#">Profil</a></li>
			<li><a href="#">Mes Demandes</a></li>
			<li><a href="Donation.jsp">Faire Demande</a></li>
			<li>
				<form action="test" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	<c:set var="donateur" value="${sessionScope.donateur}" />
	Welcome, ${donateur.prenomDonateur}!

	<h1>Profil</h1>
	<table>

		<tr>
			<td>Nom Complet</td>
			<td>${donateur.prenomDonateur}${donateur.nomDonateur}</td>
		</tr>
		<tr>
			<td>Date de Naissance</td>
			<td>${donateur.dateDeNaissance}</td>
		</tr>
		<tr>
			<td>Sexe</td>
			<td>${donateur.sexe}</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>${donateur.email}</td>
		</tr>
		<tr>
			<td>Numéro de Télephone</td>
			<td>${donateur.numTele}</td>
		</tr>
		<tr>
			<td>Ville</td>
			<td>${donateur.ville}</td>
		</tr>
	</table>
</body>
</html>