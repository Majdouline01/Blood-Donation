<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> page d'acceuil </title>
<link rel="stylesheet" type="text/css" href="../css.css">
</head>
<body>
<nav>
		<ul>
			<li><a href="profilDonateur.jsp">Profil</a></li>
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
	
</body>
</html>