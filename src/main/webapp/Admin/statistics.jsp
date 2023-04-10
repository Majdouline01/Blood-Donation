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
</head>
<body>
	<nav>
		<ul>
			<li><a href="profilAdmin.jsp">Profil</a></li>
			<li><a href="demandesDonateur.jsp">Demandes de Don</a></li>
			<li><a href="demandesReceveur.jsp">Demandes de recu</a></li>
			<li><a href="statistics.jsp">Stats</a></li>
			<li>
				<form action="logoutAdmin" method="post">
					<a><button type="submit">Se déconnecter</button></a>
				</form>
			</li>
		</ul>
	</nav>
	<c:set var="listDemandes" value="${sessionScope.stocks}" />
	
	
	<% ArrayList<Stock> myList = (ArrayList<Stock>) session.getAttribute("stocks"); %>
	<table class="table">
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
</body>
</html>