<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notre site</title>


    <link
      rel="stylesheet"
      href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" type="text/css" href="main.css"/>
    <style>
    .midle {
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			height: 40vh;
			background-color: transparent;
			
			margin: 0 auto;
			padding: 50px;
			text-align: center;
			margin-left:px;
			}

		.midle h1 {
			color: white;
			font-size: 38px;
			font-weight: bold;
			margin: 0 0 20px 0;
			background-color: transparent;
		}

		 h2 {
		 color: white;
		margin-top:10px;
			font-size: 29px;
			font-weight: normal;
			 font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
		}
	
		
.button-container {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.button-container button {
  margin: 0 10px;
}

.button-container a {
  display: block;
  width: 100%;
  height: 50%;
  color: #fff;
  text-decoration: none;
  text-align:center;
}

 .btn1 {
  width: 17rem;
  height: 3rem;
  border: none;
  outline: none;
  cursor: pointer;
  border: 2px solid transparent;
  border-radius: 2rem;
  background: rgb(155, 67, 77);
  transition: all 0.3s ease;
  font-size: 1rem;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
}
.btn2 {
  width: 17rem;
  height: 3rem;
  border: none;
  outline: none;
  cursor: pointer;
  border: 2px solid transparent;
  border-radius: 2rem;
  background: rgb(155, 67, 77);
  transition: all 0.3s ease;
  font-size: 1rem;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  
}
    </style>
  </head>
</head>
<body>
<header>
        <div class="logo">
          <p>DONATE</p>
        </div>
<nav>

	<ul class="nav-links">
		<li><a href="index.jsp" class="active">Accueil</a></li>
		<li><a href="Main/about.jsp">A propos</a></li>
		<li class="dropdown"><a href="#">Utilisateurs</a>
			<div class="dropdown-content">
				<a href="Donateur/signInDonateur.jsp">Donateur</a> 
				<a href="Receveur/SignInReceveur.jsp">Receveur</a> 
				<a href="Admin/signInAdmin.jsp">Admin</a>
			</div>
			</li>
	</ul>
	</nav>
	</header>
	<div class="midle">
	 <h1>Notre site web est dédié au don de sang et aux transfusions sanguines</h1>
	 <h2>  Joignez-vous à nous pour faire une différence dans la vie de quelqu'un en donnant votre sang aujourd'hui.</h2>
	</div>
	<div class="button-container">
	<button class="btn1"><a class="text" href="Donateur/signInDonateur.jsp">Je donne mon sang</a></button>
	<button class="btn2" ><a  class="test" href="Receveur/SignInReceveur.jsp">Besoin de sang</a></button>
	</div>
</body>
</html>