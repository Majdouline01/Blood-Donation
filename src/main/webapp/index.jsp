<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css.css">

<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
<nav>
	<div>
		<a href="#" class="logo"><box-icon name='donate-blood'></box-icon><span>Donate</span></a>
	</div>

	<ul>
		<li><a href="index.jsp">Accueil</a></li>
		<li><a href="Main/about.jsp">à propos</a></li>
		<li class="dropdown"><a href="#">Utilisateurs</a>
			<div class="dropdown-content">
				<a href="Donateur/signInDonateur.jsp">Donateur</a> 
				<a href="Receveur/SignInReceveur.jsp">Receveur</a> 
				<a href="Admin/signInAdmin.jsp">Admin</a>
			</div>
			</li>
	</ul>
	</nav>
</body>
</html>