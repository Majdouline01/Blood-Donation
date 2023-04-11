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
<title>page d'acceuil</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
    integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYlF/xIch/wEp/0RrjyDWSAzUxt2I7MhJ" 
    crossorigin="anonymous">
    <link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css" href="../profilR.css">
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
    <header>
    <div class="logo">
          <p>DONATE</p>
        </div>
	<nav>
		<ul>
			<li><a href="ReceiverHomePage.jsp" class="active" id="M">Profil</a></li>
			<li><a href="MesDemandesReceveur.jsp" id="M">Mes Demandes</a></li>
			<li><a href="ReceiverRequest.jsp" id="M">Faire Demande</a></li>
			<li>
				<form action="logout" method="post">
					<a><button class="logout" type="submit"><i class='bx bx-log-out'></i></button></a>
				</form>
			</li>
		</ul>
	</nav>
	</header>
	<c:set var="receveur" value="${sessionScope.receveur}" />
<form id="updateForm" action="updateReceveur" method="post">	
	<div class="container">
        <table class="table table-bordered">
                <tr>
                    <td>Nom</td>
                    <td id="nomReceveur"><span>${receveur.nomReceveur}</span></td>
                </tr>
                <tr>
                    <td>Prénom</td>
                    <td id="prenomReceveur"><span>${receveur.prenomReceveur}</span></td>
                </tr>
                <tr>
                    <td>Ville</td>
                    <td id="ville"><span>${receveur.ville}</span></td>
                </tr>
                <tr>
                    <td>Numéro de télé</td>
                    <td id="numTele"><span>${receveur.numTele}</span></td>
                </tr>
                <tr>
                    <td>Date de naissance</td>
                    <td id="dateDeNaissance"><span>${receveur.dateDeNaissance}</span></td>
                </tr>
        </table>
    </div>
    
     <button type="button" id="editProfileButton">Modifier</button>
    <button type="submit" id="updateProfileButton" style="display: none;">Enregistrer</button>
   </form> 
   <button class="pswd"> <a  href="changePWDR.jsp">Modifier mot de passe</a> </button>
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