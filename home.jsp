<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FCDRA</title>
    <!--Import Google Icon Font-->
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!--Import materialize.css-->
     <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
     <!--Let browser know website is optimized for mobile-->
     <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="./css/styles.css">
</head>
<body>

    <nav>
      <div class="nav-wrapper">
        <a href="#" class="brand-logo">Evacomp</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li><a href="home.jsp">My Groups</a></li>
          <li><a href="adminIndex.jsp"> Admin</a></li>
          <li> 
         		<% out.println(session.getAttribute("username"));%>
         </li>
          <li><a href="index.html"> </a></li>
          <li></li>
        </ul>
      </div>
    </nav>
    <br/>
    <% Turma[] turmas = State.getInstance().turmasbyTeacher((String)session.getAttribute("username")); %>
    <% int Code; String URL; %>
    <div class="row">
    <%for(int i=0; i< turmas.length; i++ ){ %>
      <div class="col s2">
        <div class="card-panel teal">
        	<%Code= turmas[i].getIdentifier(); %>
        	<%URL ="turma.jsp?turma=" + Code; %>
            <p class="MenuTurmas"><a href=<%out.println(URL);%> > <% out.println(turmas[i].toString()); %></a></p>
        </div>
      </div>
    <%} %>
    </div>
        
    <!--JavaScript at end of body for optimized loading-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    
    

</body>
</html>