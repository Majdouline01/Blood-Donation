<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.ReceveurDemande" %>
<%@ page import="Projet.model.Receveur" %>
<%@ page import="Projet.DAO.DonationDao" %>
<%@ page import="Projet.DAO.ReceveurDao" %>
<%
 if (session.getAttribute("receveur") == null) { 
   response.sendRedirect("SignInReceveur.jsp");
   
   return;
   }else {
	   ReceveurDao receveurDao= new ReceveurDao();
		DonationDao donationDao = new DonationDao();
		Receveur receveur = new Receveur();
		receveur = (Receveur) session.getAttribute("receveur");
		ArrayList<ReceveurDemande> listDemandes = new ArrayList<ReceveurDemande>();
		 listDemandes = donationDao.getDemandesReceveur(receveur.getcIN());
		 session.setAttribute("listDemandes", listDemandes);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demande de sang</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <link rel="stylesheet" type="text/css" href="../faire2.css">
</head>
<body>
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
	<nav>
		<ul>
			<li><a href="ReceiverHomePage.jsp">Profil</a></li>
			<li><a href="MesDemandesReceveur.jsp">Mes Demandes</a></li>
			<li><a href="ReceiverRequest.jsp" class="active">Faire Demande</a></li>
			<li>
				<form action="logout" method="post">
					<a class="log-out"><button class="logout" type="submit"><i class='bx bx-log-out'></i></button></a>
				</form>
			</li>
		</ul>
	</nav>
	</header>
	<div class="container">
	<div class="form-wrap">
	<form id="myForm" action="request" method="post" enctype="multipart/form-data">
		<div class="input-area">
		<label for="date">Date à laquelle le sang est requis :</label><br>
		<!-- <input type="date" id="date" name="date" required> -->
		 <input type="text" id="date" name="date" required>
		 </div>
		<div id="datepicker"></div>
		<div class="input-area">
		<label for="hopital">Hôpital:</label>
		 <input type="text"id="hopital" name="hopital" required>
		 </div>
		 <div class="input-area" >
		<label for="maladie">Sélectionnez votre cas
			d'uergent :</label><br> <select id="maladie" name="maladie" required>
			<option value="">Select</option>
			<option value="Des maladies chroniques">Des maladies chroniques</option>
			<option value="Des maladies du sang">Des maladies du sang</option>
			<option value="Des maladies immunitaire">Des maladies immunitaire</option>
			<option value="Cancer">Cancer</option>
			<option value="Chirurgie ">Chirurgie </option>
			<option value="raison cosmétique">raison cosmétique</option>
			<option value="Autre">Autre</option>
		</select>
		</div>
		<div>
		<label for="quantiteSang">Quantité de sang:</label>
		<input type="range" id="quantiteSang" name="quantiteSang" min="1" max="10">
		</div>
		<div id="sliderValue"></div>
		<div>
		<label for="ordonnance">Votre ordonnance</label>
		 <input type="file" id="ordonnance" name="ordonnance">
		 </div>
		 <button type="submit" value="Valider"></button>
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
      
      var slider = document.getElementById("quantiteSang");
      var output = document.getElementById("sliderValue");

      // Display the default slider value
      output.innerHTML = "Select Value";

      // Update the slider value and text when the user moves the slider
      slider.oninput = function() {
        switch(parseInt(this.value)) {
          case 1:
            output.innerHTML = "500mL";
            break;
          case 2:
            output.innerHTML = "1L";
            break;
          case 3:
            output.innerHTML = "1.5L";
            break;
          case 4:
            output.innerHTML = "2L";
            break;
          case 5:
            output.innerHTML = "2.5L";
            break;
          case 6:
            output.innerHTML = "3L";
            break;
          case 7:
            output.innerHTML = "3.5L";
            break;
          case 8:
            output.innerHTML = "4L";
            break;
          case 9:
            output.innerHTML = "4.5L";
            break;
          case 10:
            output.innerHTML = "5L";
            break;
        }
      }
    </script>
      
</body>
</html>