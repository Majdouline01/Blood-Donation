<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page d'acceuil </title>
</head>
<body>
	<c:set var="receveur" value="${sessionScope.receveur}" />                                    
	       Welcome, ${receveur.prenomReceveur}!

</body>
</html>