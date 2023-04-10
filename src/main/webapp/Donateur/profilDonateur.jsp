<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.Demandes" %>
<%@ page import="Projet.model.Donateur" %>
<%@ page import="Projet.DAO.DonationDao" %>
<%
 if (session.getAttribute("donateur") == null) { 
   response.sendRedirect("signInDonateur.jsp");   
   return;
   }else {
	   Donateur donateur = new Donateur();
	 	donateur = (Donateur) session.getAttribute("donateur");
	    DonationDao donationDao = new DonationDao();
	    ArrayList<Demandes> listDemandes = new ArrayList<Demandes>();
		listDemandes = donationDao.getDemandes(donateur.getcIN());
		session.setAttribute("listDemandes", listDemandes);
   }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profil</title>
    <link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css" href="../Profil.css">  
</head>
<body>
 <header>
        <div class="logo">
          <p>DONATE</p>
        </div>
<nav>
    <ul>
        <li><a href="profilDonateur.jsp" class="active">Profil</a></li>
        <li><a href="mesDemandes.jsp">Mes Demandes</a></li>
        <li><a href="test.jsp">Faire Demande</a></li>
        <li>
            <form action="test" method="post">
                <a><i class='bx bx-log-out'></i></a>
            </form>
        </li>
    </ul>
</nav>
</header>
<c:set var="donateur" value="${sessionScope.donateur}" />
<form id="updateForm" action="updateDonateur" method="post">
    <table>
        <tr>
            <td>Nom</td>
            <td id="nomDonateur"><span>${donateur.nomDonateur}</span></td>
        </tr>
        <tr>
            <td>Prenon</td>
            <td id="prenomDonateur"><span>${donateur.prenomDonateur}</span></td>
        </tr>
        <tr>
            <td>Date de Naissance</td>
            <td id="dateDeNaissance"><span>${donateur.dateDeNaissance}</span></td>
        </tr>
        <tr>
            <td>Sexe</td>
            <td id="sexe"><span>${donateur.sexe}</span></td>
        </tr>
        <tr>
            <td>Email</td>
            <td id="email"><span>${donateur.email}</span></td>
        </tr>
        <tr>
            <td>Numéro de Télephone</td>
            <td id="numTele"><span>${donateur.numTele}</span></td>
        </tr>
        <tr>
            <td>Ville</td>
            <td id="ville"><span>${donateur.ville}</span></td>
        </tr>
    </table>
    <button type="button" id="editProfileButton">Modifier</button>
    <button type="submit" id="updateProfileButton" style="display: none;">Enregistrer</button>
</form>
	<button class="pswd"> <a href="changePWD.jsp">Changer mot de passe</a> </button>
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