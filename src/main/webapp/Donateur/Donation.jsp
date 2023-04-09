<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demande de don</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="../css.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<nav>
		<ul>
			<li><a href="profilDonateur.jsp">Profil</a></li>
			<li><a href="mesDemandes.jsp">Mes Demandes</a></li>
			<li><a href="#">Faire Demande</a></li>
			<li>
				<form action="test" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	<c:set var="donateur" value="${sessionScope.donateur}" />
	Bienvenue, ${donateur.prenomDonateur}!
	<h1>Demande de don</h1>
	<form id="myForm" action="donate" method="post">
		<label for="date">Selectionner une date pour donner votre
			sang:</label>
		<!-- <input type="date" id="date" name="date" required> -->
		<br> <br> <input style="display:none;" type="text" id="date" name="date" required>
		<input type="Submit" value="valider">
	</form>
	<div id="datepicker"></div>
	
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
      
      
      //---------------------------------------------
// Handle form submission
document.getElementById("myForm").addEventListener("submit", function(event) {
  event.preventDefault();

  // Send the form data to the server
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "donate");
  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 200) {
        // Handle the response from the server
        if (xhr.responseText === "success") {
          showNotification("Vous pouvez donner votre dans cette date");
        } else {
        	showError("Vous ne pouvez pas donner votre sang dans cette Date");
        }
      } else {
    	  showError("An error occurred while submitting the form");
      }
    }
  };
  var formData = new FormData(event.target);
  xhr.send(new URLSearchParams(formData).toString());
});

// Show a notification
function showNotification(message) {
  var notification = document.createElement("div");
  notification.classList.add("alert");
  notification.classList.add("alert-success");
  notification.innerHTML = message;
  document.body.appendChild(notification);
  setTimeout(function() {
    document.body.removeChild(notification);
  }, 3000);
}

function showError(message){
	var notification = document.createElement("div");
	  notification.classList.add("alert");
	  notification.classList.add("alert-danger");
	  notification.innerHTML = message;
	  document.body.appendChild(notification);
	  setTimeout(function() {
	    document.body.removeChild(notification);
	  }, 3000);
}
      //------------------------------------

    </script>
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
</body>
</html>