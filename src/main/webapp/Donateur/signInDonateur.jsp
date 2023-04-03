<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign in page</title>
<link rel="stylesheet" type="text/css" href="../page.css">
</head>
<body>
	<nav>
		<ul>
			<li><a href="../index.jsp">Home</a></li>
			<li><a href="../Main/about.jsp">About</a></li>
			<li class="dropdown"><a href="#">Users</a>
				<div class="dropdown-content">
					<a href="signInDonateur.jsp">Donateur</a> 
					<a href="../Receveur/SignInReceveur.jsp">Receveur</a> 
					<a href="../Admin/signInAdmin.jsp">Admin</a>
				</div></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</nav>
	<h1>Maintenant vous pouvez connectez à votre compte</h1>
	<form action="connexion" method="post">
	<label for="email">votre email:</label>
	<input type="email" id="email" name="email" required><br>
	<br>
	<label for="password">votre mot de passe:</label>
	<input type="password" id="motDePasse" name="motDePasse" required><br>
	<br>
	<input type="submit" value="connexion">
	</form><br>
	<h2>Vous n'avez pas de compte, inscriez vous!</h2>
	<a href="test.jsp">s'inscrire</a>
</body>
</html>