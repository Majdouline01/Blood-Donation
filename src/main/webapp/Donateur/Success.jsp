<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page de rendez vous</title>
</head>
<body>
  <c:set var="donateur" value="${sessionScope.donateur}" />                                    
	       Félicitations, ${donateur.prenomDonateur}!<br>
	      <br> Vous pouvez maintenant donnez votre sang à cette date dans le plus proche centre de  votre ville ${donateur.ville}!
</body>
</html>