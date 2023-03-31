<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demande de don</title>
</head>
<body>
	<c:set var="donateur" value="${sessionScope.donateur}" />                                    
	       Welcome, ${donateur.prenomDonateur}!
	<h1>Demande de don</h1>
    <form action="donate" method="post">
        <label for="date">Selectionner une date pour donner votre sang:</label>
        <input type="date" id="date" name="date" required>
        <br><br>
        <input type="Submit" value="valider">
    </form>
</body>
</html>