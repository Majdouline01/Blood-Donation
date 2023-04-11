<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Projet.model.Stock" %>
<%@ page import="Projet.DAO.StockDao" %>
<%
 if (session.getAttribute("admin") == null) { 
   response.sendRedirect("signInAdmin.jsp");
   
   return;
   }else {
	   StockDao stockDao = new StockDao();
		 ArrayList<Stock> stocks = new ArrayList<>();
		 stocks = stockDao.getStockStats();
		 session.setAttribute("stocks", stocks);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" type="text/css" href="../Stats.css">

<body>
<header>
<div class="logo">
          <p>DONATE</p>
        </div>
	<nav>
		<ul>
			<li><a href="profilAdmin.jsp" id="M">Profil</a></li>
			<li><a href="demandesDonateur.jsp" id="M">Demandes de Don</a></li>
			<li><a href="demandesReceveur.jsp" id="M">Demandes de recu</a></li>
			<li><a href="statistics.jsp" class="active" id="M">Stats</a></li>
			<li>
				<form action="logoutAdmin" method="post">
					<a class="log-out" id="N"><button class="logout" type="submit"><i class='bx bx-log-out'></i></button></a>
				</form>
			</li>
		</ul>
	</nav>
	</header>
	<c:set var="listDemandes" value="${sessionScope.stocks}" />
	
	
	<% ArrayList<Stock> myList = (ArrayList<Stock>) session.getAttribute("stocks"); %>
	<table class="table" style="display:none;">
		<thead>
			<tr>
				<th>ID</th>
				<th>TYPE</th>
				<th>QUANTITE</th>

			</tr>
		</thead>
		<tbody>
			<%
			for (Stock myObject : myList) {
				
			%>
			<tr>
				<td><%=myObject.getId()%></td>
				<td><%=myObject.getType()%></td>
				<td><%=myObject.getQuantite()%></td>
				</td>
				<td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	
	<!-- Include the Chart.js library -->



<div class="chart-container">
  <canvas id="myChart" width="400" height="400"></canvas>
</div>



  <script>
    //Get the table element
    const table = document.querySelector('.table');

    // Get the table rows
    const rows = table.querySelectorAll('tr');

    // Define arrays to hold the labels and data for the chart
    const labels = [];
    const data = [];

    // Loop through the table rows and extract the data
    for (let i = 1; i < rows.length; i++) {
      const cells = rows[i].querySelectorAll('td');
      labels.push(cells[1].textContent);
      data.push(cells[2].textContent);
    }

    // Define the data for the chart
    const chartData = {
      labels: labels,
      datasets: [{
        label: 'Stock Quantities',
        data: data,
        backgroundColor: [
          'rgba(255, 99, 132, 0.4)',
          'rgba(54, 162, 235, 0.4)',
          'rgba(255, 206, 86, 0.4)',
          'rgba(75, 192, 192, 0.4)',
          'rgba(153, 102, 255, 0.4)',
          'rgba(255, 159, 64, 0.4)'
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1
      }]
    };

    // Define the options for the chart
    const chartOptions = {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true,
            fontColor: '#444'
          },
          gridLines: {
            color: '#ddd',
            lineWidth: 1
          }
        }],
        xAxes: [{
          ticks: {
            fontColor: '#444'
          },
          gridLines: {
            color: '#ddd',
            lineWidth: 1
          }
        }]
      },
      animation: {
        duration: 1000,
        easing: 'easeOutBounce'
      },
      legend: {
        labels: {
          fontColor: '#444',
          fontSize: 14
        }
      }
    };

    // Get the chart canvas element
    const chartCanvas = document.getElementById('myChart');

    // Create the chart
    const stockChart = new Chart(chartCanvas, {
      type: 'bar',
      data: chartData,
      options: chartOptions
    });
  </script>


	
</body>
</html>