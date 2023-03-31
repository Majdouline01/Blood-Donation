<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demande de sang</title>
</head>
<body>
	<h1>Formulaire de demande de sang</h1>
	<form action="Request" method="POST" enctype="multipart/form-data">
		<label for="date">Date à laquelle le sang est requis :</label><br>
		<input type="date" id="date" name="date" required><br><br>

		<label for="hopital">Hôpital:</label><br>
		<input type="text" id="hopital" name="hopital" required><br><br>


		<label for="maladie">Sélectionnez votre cas d'uergent :</label><br>
		<select id="maladie" name="maladie" required>
			<option value="">Select</option>
			<option value="maladie1">un accident de route </option>
			<option value="maladie2">Des maladies du sang </option>
			<option value="maladie3">Des maladies immunitaire</option>
			<option value="maladie4">Cancer </option>
			<option value="maladie5">Autre </option>
		</select><br><br>
		<label for="quantiteSang">Quantité de sang:</label><br>
		<input type="number" id="quantiteSang" name="quantiteSang"><br><br>
		<label for="ordonnance">Votre ordonnance</label><br>
		<input type="file" id="ordonnance" name="ordonnance"><br><br>

		<input type="submit" value="Valider">
	</form>
</body>
</html>