<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page d'inscription pour donateur</title>
<link rel="stylesheet" type="text/css" href="../SignUp.css">
</head>
<body>
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
<nav>
		<ul>
			<li><a href="../index.jsp">Home</a></li>
			<li><a href="../Main/about.jsp">About</a></li>
			<li class="dropdown"><a href="#">Utilisateurs</a>
				<div class="dropdown-content">
					<a href="signInDonateur.jsp">Donateur</a> 
					<a href="../Receveur/SignInReceveur.jsp">Receveur</a> 
					<a href="../Admin/signInAdmin.jsp">Admin</a>
				</div></li>
		</ul>
	</nav>
	</header>
 <div class="container">
        <div class="form-wrap">
          <h1>Formulaire d'inscription</h1>
          <form action="s'inscrire" method="post">
            <div class="input-area">
              <label for="text"></label>
              <input type="text" name="nomDonateur" id="nomDonateur" placeholder="Votre nom" required>
            </div>
            <div class="input-area">
              <label for="text"></label>
              <input type="text" name="prenomDonateur" id="prenomDonateur" placeholder="Votre prénom" required>
            </div>
            <div class="input-area">
              <label for="text"></label>
              <input type="text" name="cIN" id="cIN" placeholder="Votre CIN" required>
            </div>
            <div class="input-area">
              <label for="groupage"></label>
              <select name="groupage" id="groupage" required>
                <option value="">Votre groupe sanguin</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
              </select>
            </div>
            <div class="input-area">
                <label for="text"></label> 
              <div class="input-area">
	            <input type="radio" id='sexe' name='sexe' value="Homme" required>
                <span class="radio-label">Homme</span>
	            <input type="radio" id='sexe' name='sexe' value="Femme" required>
                <span class="radio-label">Femme</span>
              </div>
            </div>
            <div class="input-area">
              <label for="number"></label>
              <input type="number" name="numTele" id="numTele" placeholder="Numéro de téléphone" required>
            </div>
            <div class="input-area">
             <label for="text"></label>
             <input type="text" name="ville" id="ville" placeholder="Votre ville" required>
            </div>
            <div class="input-area">
                <label for="date"></label>
                <input type="date" name="dateDeNaissance" id="dateDeNaissance" placeholder="Date de naissance " required>
            </div>
            <div class="input-area">
                <label for="password"></label>
                <input type="password" name="motDePasse" id="motDePasse" placeholder="MotDePasse" required>
             </div>
            <div class="input-area">
                <label for="email"></label>
                <input type="email" name="email" id="email" placeholder="Email" required>
             </div>
            <div class="button-area">
              <button type="submit">S'inscrire</button>
            </div>
          </form>
        </div>
      </div>

</body>
</html>