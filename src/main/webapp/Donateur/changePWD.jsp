<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<nav>
    <ul>
        <li><a href="profilDonateur.jsp">Profil</a></li>
        <li><a href="mesDemandes.jsp">Mes Demandes</a></li>
        <li><a href="Donation.jsp">Faire Demande</a></li>
        <li>
            <form action="test" method="post">
                <a><button type="submit">Se déconnecter</button></a>
            </form>
        </li>
    </ul>
</nav>
	<form action="changePwd" method="post">
		Old Password<input name="oldPwd" type="password">
		New Password<input name="newPwd" type="password">
		Confirm Password<input type="password">
		<input type="submit">
	</form>
</body>
</html>