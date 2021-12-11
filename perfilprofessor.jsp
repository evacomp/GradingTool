<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.*" %>
<%@page import="java.util.*"%>
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

<% 
if(request.getParameter("turma")!=null)
	session.setAttribute("turmaid",request.getParameter("turma"));
else
	session.getAttribute("turma");
%>

 <!--Menu-->
    <nav>
      <div class="nav-wrapper">
        <a href="#" class="brand-logo">FCDRA</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li><a href="home.html">As Minhas Turmas</a></li>
          <li><a href="adminIndex.jsp"> Admin </a></li>
          <li> 
         		<% out.println(session.getAttribute("username"));%>
         </li>
          <li><a href="index.html"> </a></li>
          <li></li>
        </ul>
      </div>
    </nav>
    <br/>
    
 <%
    String nr=(String) request.getParameter("nr");
 	
 	Teacher teacher= State.getInstance().getTeacherbyTeacherNumber(nr);
 	
	%>  	



<div class="row">
    <div class="col s12 m6">
      <div class="card teal darken-1">
        <div class="card-content white-text">
          <span class="card-title"> <%out.println(teacher.getFirtName()+ " "+ teacher.getLastName()); %> </span>
          
    		<br/>
    		
    		<p> Teacher Number: <%out.println(nr); %></p>
    		<p> Contacto: <%out.println(teacher.getContact()); %></p>    
    		
    		<p>Admin: <%out.println(teacher.getAdminStatus()); %></p>
        </div>
        <%String URL1="modificarprofessor.jsp?nr="+nr; %>
        <div class="card-action">
          <a href=<%out.println(URL1); %>> Modificar perfil</a>
        </div>
      </div>
    </div>
  </div>            
            
    
    
 
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
 

</body>
</html>