<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page d'inscription pour le receveur</title>
</head>
<body>
	<h1> Bonjour cher receveur, veuillez entrer les informations suivantes </h1>
	<form action="S'inscrire" method="post">
	<label for="nomReceveur">Entrer votre nom:</label>
	<input type="text" id='nomReceveur' name='nomReceveur' required><br>
	<br>
	<label for="prenomReceveur">Entrer votre prénom:</label>
	<input type="text" id='prenomReceveur' name='prenomReceveur' required><br>
	<br>
	<label for="text">Entrer votre CIN:</label>
	<input type="text" id='cIN' name='cIN' required><br>
	<br>
	<label for="text">choisissez votre sexe:</label> <br>
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
	<label for="number">Quantité de sang désiré:</label>
	<input type="number" id="quantiteSang" name="quantiteSang" required><br>
	<br>
	<label for="email">votre email:</label>
	<input type="email" id="email" name="email" required><br>
	<br>
	<input type="submit" value="S'inscrire">
	</form>

</body>
</html>