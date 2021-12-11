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
    <h3> Novo Professor</h3>
    
   <div class="row">
    	<div class="col s6">
    		<div class="input-field">
      			<i class="material-icons prefix">mode_edit</i>
      			<input id="NrProfessor" type="text">
      			<label for="NrProfessor">Nr Docente</label>
      			<br/><br/>
    		</div>
    		<div class="input-field">
      			<i class="material-icons prefix">mode_edit</i>
      			<input id="Username" type="text">
      			<label for="Username">Username</label>
      			<br/><br/>
   			</div>
    		<div class="input-field">
      			<i class="material-icons prefix">mode_edit</i>
      			<input id="PNome" type="text">
      			<label for="PNome">Nome</label>
      			<br/><br/>
   			</div>
	    	<div class="input-field">
    	  		<i class="material-icons prefix">mode_edit</i>
      			<input id="UNome" type="text">
     			<label for="UNome">Apelido</label>
      			<br/><br/>
    		</div>
    		<div class="input-field">
      			<i class="material-icons prefix">mode_edit</i>
      			<input id="password" type="password">
      			<label for="password">Password</label>
      			<br/><br/>
    		</div>
    		<p>
    			<label>
      			<input id="isAdminstrator" vclass="with-gap" name="isAdminstrator" type="radio" />
      			<span>Administrador</span>
   				</label>
  			</p>
    	</div>
    </div>

<form method="post" name="Prof" onsubmit="return checkform(this);" >
    <button class="btn waves-effect waves-light" type="submit" name="action">Novo Professor
        	<i class="material-icons right">send</i>
      </button>
</form>
    
    
    
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript" src="js/newteacher.js"></script>

</body>
</html>