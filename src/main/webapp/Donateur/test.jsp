<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Quiz</title>
    <link rel="stylesheet" type="text/css" href="../css.css">
    <style>
      #question-container {
        width: 50%;
        margin: 0 auto;
        text-align: center;
      }
      #error-container {
        width: 50%;
        margin: 0 auto;
        text-align: center;
      }
      #result {
        width: 50%;
        margin: 0 auto;
        text-align: center;
      }

      #options-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin-top: 20px;
      }

      .option {
        margin: 10px;
        padding: 10px 20px;
        border: none;
        background-color: #f2f2f2;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        transition: all 0.3s ease-in-out;
      }

      .option:hover {
        background-color: #d9d9d9;
        transform: translateY(-2px);
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.3);
      }
    </style>
  </head>

  <body>
  <nav>
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="Main/about.jsp">About</a></li>
			<li class="dropdown"><a href="#">Users</a>
				<div class="dropdown-content">
					<a href="Donateur/signInDonateur.jsp">Donateur</a> 
					<a href="Receveur/SignInReceveur.jsp">Receveur</a> 
					<a href="Admin/signInAdmin.jsp">Admin</a>
				</div></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</nav>
    <div id="question-container">
      <div id="question-text"></div>
      <div id="options-container"></div>
    </div>
    <div id="error-container">
      <p id="error-message" style="display: none; color: red">
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
	  window.location.replace("http://localhost:8080/ProjetFinEtude");
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
          alert("Vous aavez compléter le test avec succés!");
          returnButton.style.display = "none";

          //create a link for the signup page
          const link = document.createElement("a");
          link.href = "SignUpDonator.jsp";
          link.innerText = "Cliquez ici pour aller s'incsrire";
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