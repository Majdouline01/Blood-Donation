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
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<c:set var="error" value="${sessionScope.error}" />
<nav>
    <ul>
        <li><a href="profilDonateur.jsp">Profil</a></li>
        <li><a href="mesDemandes.jsp">Mes Demandes</a></li>
        <li><a href="test.jsp">Faire Demande</a></li>
        <li>
            <form action="test" method="post">
                <a><button type="submit">Se déconnecter</button></a>
            </form>
        </li>
    </ul>
</nav>
	<form action="changePwd" method="post">
		<div class="input-area">
		<input name="oldPwd" type="password" placeholder="Ancien mot de passe">
		</div>
		<c:if test="${error == true}">
        <span class="text-danger">Mot de passe incorrecte</span>
         <%session.removeAttribute("error");%>
		</c:if>
          <div class="button-area">
		<input name="newPwd" type="password" placeholder="Nouveau mot de passe">
		<input type="password" placehoolder="Confirmer mot de passe">
		<input type="submit">
		</div>
	</form>
</body>
</html>