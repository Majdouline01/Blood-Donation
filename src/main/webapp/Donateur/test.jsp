<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.Demandes" %>
<%@ page import="Projet.model.Donateur" %>
<%@ page import="Projet.DAO.DonationDao" %>
<%
 if (session.getAttribute("donateur") == null) { 
   response.sendRedirect("signInDonateur.jsp");
   
   return;
   }else {
	   Donateur donateur = new Donateur();
	 	donateur = (Donateur) session.getAttribute("donateur");
	    DonationDao donationDao = new DonationDao();
	    ArrayList<Demandes> listDemandes = new ArrayList<Demandes>();
		listDemandes = donationDao.getDemandes(donateur.getcIN());
		session.setAttribute("listDemandes", listDemandes);
   }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Test de pré-donation</title>
    <link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css" href="../test.css">
    <style>
 body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height:100vh;
}

#question-container {
  margin-top: 180px;
  background-color: transparent;
  border: 2px solid #ccc;
  border-radius: 5px;
  padding: 20px;
  max-width: 500px;
  width: 100%;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

#question-text {
  font-size: 1.5rem;
  margin-bottom: 20px;
 
}

#options-container {
  display: flex;
  flex-direction: column;
  
}
body {
    display: flex;
    width: 100%;
    height: 100vh;
    align-items: center;
    justify-content: center;
    background: linear-gradient(45deg, rgba(90, 61, 61, 0.5), rgba(112, 150, 174, 0.7));
    background-size: cover;
    background-position: center;
}


.option {
  background-color: #f7f7f7;
  border: none;
  border-radius: 10px;
  padding: 10px;
  margin-bottom: 10px;
  cursor: pointer;
  transition: all 0.3s ease-in-out;
}

.option:hover {
  background-color: #eee;
}

#error-container {
  margin-top: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

#error-message {
  color: white;
  font-weight: bold;
  margin-bottom: 20px;
}

#return-button {
  background-color: #152c46;
  border: none;
  border-radius: 10px;
  padding: 10px;
  cursor: pointer;
  transition: all 0.3s ease-in-out;
  color:white;
}

#return-button:hover {
  background-color: #aaa;
}

#quit {
  margin-top: 20px;
}

#quit button {
  background-color: #ccc;
  border: none;
  border-radius: 5px;
  padding: 10px;
  cursor: pointer;
  transition: all 0.3s ease-in-out;
  color: black;
}

#quit button:hover {
  background-color: #aaa;
}

#result {
  margin-top: 20px;
  text-align: center;
}
   button .logout{
    width: 4rem;
    height: 3rem;
    border: none;
    outline: none;
    color: #fff;
    font-size: 1rem;
    cursor: pointer;
    border: 2px solid transparent;
    border-radius: 2rem;
    background: rgb(155, 67, 77);
    transition: all 0.3s ease;
    margin-top: 20px;
    display: block;
  margin: 0 auto;
  }


    </style>
  </head>

  <body>
  <header>
        <div class="logo">
          <p>DONATE</p>
        </div>
  <nav>
		<ul>
			<li><a href="index.jsp" id="M">Accueil</a></li>
			<li><a href="Main/about.jsp" id="M">A propos</a></li>
			<li><a href="test.jsp" id="M" class="active" >Faire Demande</a></li>
			<li>
            <form action="test" method="post">
                <a class="log-out" id="N"><button class="logout" type="submit"><i class='bx bx-log-out'></i></button></a>
            </form>
        </li>
		
		</ul>
	</nav>
	</header>
    <div id="question-container">
      <div id="question-text"></div>
      <div id="options-container"></div>
    </div>
    <div id="error-container">
      <p id="error-message" style="display: none;">
        Désolé vous ne pouvez pas donner votre sang 
      </p>
      <button id="return-button" style="display: none" onclick="returnFunction();">retour</button>
    </div>
	<div id="quit">
		<button onclick="quitFunction();">Quitter le test</button>
	</div>
    <div id="result"></div>
  </body>

  <script>
  function quitFunction(){
	  window.location.replace("http://localhost:8080/ProjetFinEtude/Donateur/mesDemandes.jsp");
  }
  
    const questions = [
      {
        id: 1,
        question: "Votre dernier don date?",
        options: ["Moins de 8 semaines", "Plus de 8 semaines"],
      },
      {
        id: 2,
        question:
          "Avez-vous déjà été diagnostiqué avec VIH(sida) ou bien les hépatites B et C ou la syphilis?",
        options: ["Oui", "Non"],
      },
      {
        id: 3,
        question:
          "Êtes-vous traité(e) pour une maladie chronique telle que : diabète (traité par insuline)?",
        options: ["Oui", "Non"],
      },
      {
        id: 4,
        question:
          "Avez-vous fait un tatouage ou un piercing (oreilles comprises) dans les 4 derniers mois ?",
        options: ["Oui", "Non"],
      },
      {
        id: 5,
        question:
          "Êtes-vous suivi(e) par votre médecin pour une anémie ou un manque de fer ?",
        options: ["Oui", "Non"],
      },
      {
        id: 6,
        question: "Avez-vous été opéré(e) dans les 4 derniers mois ?",
        options: ["Oui", "Non"],
      },
      {
        id: 7,
        question:
          "Avez-vous eu de la fièvre ou une infection dans les 2 dernières semaines ?",
        options: ["Oui", "Non"],
      },
      {
        id: 8,
        question: "Avez-vous eu des soins dentaires depuis moins de 24 heures?",
        options: ["Oui", "Non"],
      },
      {
        id: 9,
        question: "Prenez-vous des médicaments, même tous les jours ?",
        options: ["Oui", "Non"],
      },
    ];

    let currentQuestion = 0;
    let currentQuestionIndex = 0;
    const questionContainer = document.getElementById("question-container");
    const questionText = document.getElementById("question-text");
    const optionsContainer = document.getElementById("options-container");
    const errorContainer = document.getElementById("error-container");

    let returnButton = document.getElementById("return-button");
    let result = document.getElementById("result");
    let errorMessage = document.getElementById("error-message");
    
    function showQuestion() {
    	questionContainer.style.display = "";
    	errorMessage.style.display = "none";
      if (currentQuestionIndex > 0) {
        returnButton.style.display = "";
      }else
    	  returnButton.style.display = "none";
      
      currentQuestion = questions[currentQuestionIndex];
      questionText.innerText = currentQuestion.question;
      optionsContainer.innerHTML = "";

      currentQuestion.options.forEach((option) => {
        const button = document.createElement("button");
        button.classList.add("option");
        button.innerText = option;
        button.addEventListener("click", nextQuestion);
        optionsContainer.appendChild(button);
      });
    }

    function nextQuestion() {
      //console.log('nextQuestion function called');
      if (validateAnswer()) {
        currentQuestionIndex++;

        if (currentQuestionIndex < questions.length) {
          currentQuestion = questions[currentQuestionIndex];
          showQuestion();
        } else if (
          // End of quiz
          currentQuestionIndex === questions.length
        ) {
          questionContainer.style.display = "none";
          alert("Vous avez compléter le test avec succés!");
          returnButton.style.display = "none";

          //create a link for the signup page
          const link = document.createElement("a");
          link.href = "Donation.jsp";
          link.innerText = "Cliquez ici pour donner votre sang";
          result.appendChild(link);

          return;
        }
      } else {
        // Invalid answer
        questionContainer.style.display = "none";
        
        errorMessage.style.display = "";
        returnButton.style.display = "";
      }
    }
    

	function returnFunction() {
		console.log();
		if (currentQuestionIndex > 0) {
			currentQuestionIndex--;
		}
		showQuestion();
	}

    function validateAnswer() {
      const selectedOption = event.target.innerText;
      if (selectedOption === "") {
        return false;
      }

      const currentQuestion = questions[currentQuestionIndex];
      const selectedValue = selectedOption;
      if (currentQuestion.id === 1 && selectedValue === "Plus de 8 semaines") {
        // Validation for question 1
        return true;
      } else if (currentQuestion.id === 2 && selectedValue === "Non") {
        // Validation for question 2
        return true;
      } else if (currentQuestion.id === 3 && selectedValue === "Non") {
        // Validation for question 3
        return true;
      } else if (currentQuestion.id === 4 && selectedValue === "Non") {
        // Validation for question 4
        return true;
      } else if (currentQuestion.id === 5 && selectedValue === "Non") {
        // Validation for question 5
        return true;
      } else if (currentQuestion.id === 6 && selectedValue === "Non") {
        // Validation for question 6
        return true;
      } else if (currentQuestion.id === 7 && selectedValue === "Non") {
        // Validation for question 7
        return true;
      } else if (currentQuestion.id === 8 && selectedValue === "Non") {
        // Validation for question 8
        return true;
      } else if (currentQuestion.id === 9 && selectedValue === "Non") {
        // Validation for question 9
        return true;
      } else {
        return false;
      }
    }

    showQuestion();
  </script>
</html>
