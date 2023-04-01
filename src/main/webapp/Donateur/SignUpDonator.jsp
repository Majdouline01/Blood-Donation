<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page d'inscription pour donateur</title>
<link rel="stylesheet" type="text/css" href="../css.css">
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
<h1> Bonjour cher donateur, veuillez entrer les informations suivantes </h1>
	<form action="s'inscrire" method="post">
	<label for="text"> votre nom:</label>
	<input type="text" id="nomDonateur" name="nomDonateur"required><br>
	<br>
	<label for="text">votre prenom</label>
	<input type="text" id='prenomDonateur' name='prenomDonateur' required><br>
	<br>
	<label for="text">votre CIN:</label>
	<input type="text" id='cIN' name='cIN' required><br>
	<br>
	<label for="text">votre sexe:</label> <br>
	<input type="radio" id='sexe' name='sexe' value="Homme" required>Homme<br>
	<input type="radio" id='sexe' name='sexe' value="Femme" required>Femme<br>
	<br>
	<label for="groupage">choisissez votre groupage</label>
    <select id="groupage" name="groupage">
    <option value="A+">A+</option>
    <option value="A-">A-</option>
    <option value="B+">B+</option>
    <option value="B-">B-</option>
    <option value="AB+">AB+</option>
    <option value="AB-">AB-</option>
    <option value="O+">O+</option>
    <option value="O-">O-</option>
    </select>
	<br><br>
	<label for="number">votre numéro de téléphone:</label>
	<input type="number" id='numTele' name='numTele' required><br>
	<br>
	<label for="text">votre ville:</label>
	<input type="text" id='ville' name='ville' required><br>
	<br>
	<label for="date">votre date de naissance:</label>
	<input type="date" id='dateDeNaissance' name='dateDeNaissance' required><br>	
	<br>
	<label for="password">votre mot de passe:</label>
	<input type="password" id="motDePasse" name="motDePasse" required><br>
	<br>
	<label for="email">votre email:</label>
	<input type="email" id="email" name="email" required><br>
	<br>
	<input type="submit" value="s'inscrire">
	</form>

</body>
</html>