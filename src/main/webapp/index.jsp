<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="page.css">
</head>
<body>
	<nav>
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="Main/about.jsp">About</a></li>
			<li class="dropdown"><a href="#">Users</a>
				<div class="dropdown-content">
					<a href="Donateur/signInDonateur.jsp">Donateur</a> 
					<a href="Receveur/SignInReceveur.jsp">Receveur</a> 
					<a href="Admin/signInAdmin.jsp">Admin</a>
				</div></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</nav>

</body>
</html>