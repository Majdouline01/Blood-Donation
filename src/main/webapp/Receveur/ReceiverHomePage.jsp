<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page d'acceuil</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
    integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYlF/xIch/wEp/0RrjyDWSAzUxt2I7MhJ" 
    crossorigin="anonymous">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi4h1HM" 
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" 
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" 
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" 
    integrity="sha384-Wsk5IB+IQRgdeLhBE1a5G39J36ysw7jKASxLBiAdGNEFgyeLyKp0Ff5q5tocn+i6" 
    crossorigin="anonymous"></script>
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
	<c:set var="receveur" value="${sessionScope.receveur}" />
	Welcome, ${receveur.prenomReceveur}!
<form id="updateForm" action="updateReceveur" method="post">	
	<div class="container">
        <h1>Person Information</h1>
        <table class="table table-bordered">
                <tr>
                    <td>Name</td>
                    <td id="nomReceveur"><span>${receveur.nomReceveur}</span></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td id="prenomReceveur"><span>${receveur.prenomReceveur}</span></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td id="ville"><span>${receveur.ville}</span></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td id="numTele"><span>${receveur.numTele}</span></td>
                </tr>
                <tr>
                    <td>Birth Year</td>
                    <td id="dateDeNaissance"><span>${receveur.dateDeNaissance}</span></td>
                </tr>
        </table>
    </div>
    
     <button type="button" id="editProfileButton">Modifier le profil</button>
    <button type="submit" id="updateProfileButton" style="display: none;">Enregistrer les modifications</button>
   </form> 
   <button> <a href="changePWDR.jsp">Change Password</a> </button>
    <script>
  // Get elements
  const editProfileButton = document.getElementById("editProfileButton");
  const updateProfileButton = document.getElementById("updateProfileButton");
  const tableRows = document.querySelectorAll("table tr");
  
  // Hide update button initially
  updateProfileButton.style.display = "none";
  
  // Add click event listener to edit profile button
  editProfileButton.addEventListener("click", function() {
    // Toggle input fields and update button
    for (let i = 0; i < tableRows.length; i++) {
      const td = tableRows[i].getElementsByTagName("td")[1];
      const span = td.getElementsByTagName("span")[0];
      const input = document.createElement("input");
      input.type = "text";
      input.value = span.innerHTML;
      input.name = td.id;
      td.innerHTML = "";
      td.appendChild(input);
    }
    editProfileButton.style.display = "none";
    updateProfileButton.style.display = "block";
  });
</script>

</body>
</html>