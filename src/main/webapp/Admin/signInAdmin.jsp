<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin's login page</title>
<link rel="stylesheet" type="text/css" href="../css.css">
</head>
<body>
<nav>
		<ul>
			<li><a href="../index.jsp">Home</a></li>
			<li><a href="../Main/about.jsp">About</a></li>
			<li class="dropdown"><a href="#">Users</a>
				<div class="dropdown-content">
					<a href="../Donateur/signInDonateur.jsp">Donateur</a> 
					<a href="../Receveur/SignInReceveur.jsp">Receveur</a> 
					<a href="signInAdmin.jsp">Admin</a>
				</div></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</nav>
	<form action="loginAdmin" method="post">
	<label for="AdminName">Enter your AdminName:</label>
	<input type="text" id='AdminName' name='email' required><br>
	<br>
	<label for="password">Enter your Password:</label>
	<input type="password" id="password" name="motDePasse" required><br>
	<br>
	<input type="submit" value="Login">
	</form>
</body>
</html>

<!--test az el arab-->
<!--test reply-->
<!--test az el arab-->