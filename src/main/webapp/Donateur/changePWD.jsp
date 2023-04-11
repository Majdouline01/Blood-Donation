<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 if (session.getAttribute("donateur") == null) { 
   response.sendRedirect("signInDonateur.jsp");
   return;
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Changer mot de passe</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" type="text/css" href="../change.css">
</head>
<body>
<c:set var="error" value="${sessionScope.error}" />
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
<nav>
    <ul>
        <li><a href="profilDonateur.jsp" id="M" class="active">Profil</a></li>
        <li><a href="mesDemandes.jsp" id="M">Mes Demandes</a></li>
        <li><a href="test.jsp" id="M">Faire Demande</a></li>
        <li>
            <form action="test" method="post">
                <a class="log-out" id="N"><button class="logout" type="submit" ><i class='bx bx-log-out'></i></button></a>
            </form>
        </li>
    </ul>
</nav>
</header>
	<form action="changePwd" method="post">
		<div class="input-area">
		<label for="password">Ancien mot de passe:</label>
		<input name="oldPwd" type="password" autofocus>
		</div>
		<c:if test="${error == true}">
        <span class="text-danger">Mot de passe incorrecte</span>
         <%session.removeAttribute("error");%>
		</c:if>
		<div class="input-area">
          <label for="password">Nouveau mot de passe:</label>
		<input name="newPwd" type="password">
		</div>
		<div class="input-area">
		<label for="password">Confirmer mot de passe:</label>
		<input type="password" >
		</div>
		<div class="button-area">
		<button class="submit" type="submit">Enregistrer</button>
		
		</div>
	</form>
</body>
</html>