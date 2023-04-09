<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign in page</title>
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../SignIn.css">
</head>
<body>
<c:set var="error" value="${sessionScope.error}" />
	<header>
    <div class="logo">
      <p>DONATE</p>
    </div>
	<nav>
		
		<ul class="nav-links">
			<li><a href="../index.jsp">Home</a></li>
			<li><a href="../Main/about.jsp">About</a></li>
			<li class="dropdown"><a href="#">Users</a>
				<div class="dropdown-content">
					<a href="../Donateur/signInDonateur.jsp">Donateur</a> <a
						href="SignInReceveur.jsp">Receveur</a> <a
						href="../Admin/signInAdmin.jsp">Admin</a>
				</div></li>
		</ul>
	</nav>
	</header>
	<div class="container">
      <div class="login-wrap">
        <div class="title">
          <h1>Connexion au compte</h1>

        </div>
        <form action="Connexion" method="post">
          <div class="input-area">
            <input type="email" id="email" name="email" autofocus placeholder="Email" required>
            <label for="email"></label>
          </div>
          <div class="input-area">
            <input type="password" id="motDePasse" name="motDePasse"  placeholder="Mot de passe" required>
            <label for="password" ></label>
          </div>
	
                  <c:if test="${error == true}">
   								<span class="text-danger">Invalid username or password</span>
   								<%
    								session.removeAttribute("error");
								%>
							</c:if>
		<div class="button-area">
            <button class="login-button">Connexion</button>
          </div>
          <div class="form-toggle-area">
            <p>Vous n'avez pas de compte <a href="SignUpReceiver.jsp">s'inscrire</a>.</p>

          </div>


        </form>

      </div>

    </div>
                
</html>