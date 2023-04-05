<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demande de sang</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<style>
.datepicker-buttons .ui-state-default {
	border: none;
	background-color: #fff;
	color: #000;
	padding: 0.25em 0.5em;
	margin: 0.25em;
	border-radius: 0.25em;
	cursor: pointer;
}

.datepicker-buttons .ui-state-disabled {
	color: #999;
	cursor: default;
}
</style>
</head>
<body>
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
	<h1>Formulaire de demande de sang</h1>
	<form id="myForm" action="request" method="post">
		<label for="date">Date à laquelle le sang est requis :</label><br>
		<label for="date">Selectionner une date pour donner votre
			sang:</label>
		<!-- <input type="date" id="date" name="date" required> -->
		<br> <br> <input type="text" id="date" name="date" required>
		<div id="datepicker"></div>
		<label for="hopital">Hôpital:</label><br> <input type="text"
			id="hopital" name="hopital" required><br>
		<br> <label for="maladie">Sélectionnez votre cas
			d'uergent :</label><br> <select id="maladie" name="maladie" required>
			<option value="">Select</option>
			<option value="un accident de route">un accident de route</option>
			<option value="Des maladies du sang">Des maladies du sang</option>
			<option value="Des maladies immunitaire">Des maladies immunitaire</option>
			<option value="Cancer">Cancer</option>
			<option value="Autre">Autre</option>
		</select><br>
		<br> <label for="quantiteSang">Quantité de sang:</label><br>
		<input type="number" id="quantiteSang" name="quantiteSang"><br>
		<br> <label for="ordonnance">Votre ordonnance</label><br> <input
			type="file" id="ordonnance" name="ordonnance"><br>
		<br> <input type="submit" value="Valider">
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
	<script>
      document.addEventListener("DOMContentLoaded", function() {
        var minDate = new Date();
        minDate.setDate(minDate.getDate()); // Set minimum date to tomorrow
        var maxDate = new Date();
        maxDate.setMonth(maxDate.getMonth() + 1); // Set maximum date to within a month
        var datepicker = document.querySelector("#datepicker");
        $(datepicker).datepicker({
          minDate: minDate,
          maxDate: maxDate,
          beforeShowDay: function(date) {
            var today = new Date();
            today.setHours(0, 0, 0, 0);
            var d = new Date(date);
            d.setHours(0, 0, 0, 0);
            return [d >= minDate && d <= maxDate && d >= today]; // Disable dates before tomorrow and after a month
          },
          onSelect: function(date) {
            document.querySelector("#date").value = date; // Set the selected date in the form input
          }
        }).datepicker("widget").classList.add("datepicker-buttons");
      });
    </script>
      
</body>
</html>