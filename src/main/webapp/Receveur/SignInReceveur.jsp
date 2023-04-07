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
	<nav>
		<div>
			<a href="#" class="logo"><i class='bx bx-donate-blood'></i><span>Donate</span></a>
		</div>
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
	<div class="container">
        <h1 class="text-center mb-4">Bonjour Cher Receveur, vous pouvez vous connecter à votre compte</h1>
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="card">
              <div class="card-body">
                <form action="Connexion" method="post">
                  <div class="form-group">
                    <label for="email">Email :</label>
                    <input type="email" id="email" name="email" class="form-control" required autofocus>
                  </div>
                  <div class="form-group">
                    <label for="password">Mot de passe :</label>
                    <input type="password" id="motDePasse" name="motDePasse" class="form-control" required>
                  </div>
                  <c:if test="${error == true}">
   								<span class="text-danger">Invalid username or password</span>
   								<%
    								session.removeAttribute("error");
								%>
							</c:if>
                  <button type="submit" class="btn btn-primary btn-block mt-4">Connexion</button>
                </form>
              </div>
            </div>
            <div class="mt-3 text-center">
              <p>Vous n'avez pas de compte, inscrivez-vous <a href="SignUpReceiver.jsp">ici</a>.</p>
            </div>
          </div>
        </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>      
</body>
</html>