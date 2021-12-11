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
          <li><a href="home.jsp">As Minhas Turmas</a></li>
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
 	int number= Integer.parseInt(nr);
 	
 	Student student= State.getInstance().getStudentByStudentNr(number);
 	
	%>  	



<div class="row">
    <div class="col s12 m6">
      <div class="card teal darken-1">
        <div class="card-content white-text">
          <span class="card-title"> <%out.println(student.getFirtsName()+ " "+ student.getLastName()); %> </span>
          
          <div class="input-field">
      		<i class="material-icons prefix">mode_edit</i>
      		<input id="StudentNumber" type="text">
      		<label for="Student"><%out.println("Número Estundante "+ student.getStudentNumber()); %></label>
      		<br/><br/>
      		</div>
          
          <div class="input-field">
      		<i class="material-icons prefix">mode_edit</i>
      		<input id="FirstName" type="text">
      		<label for="FirstName"><%out.println("Nome: "+ student.getFirtsName()); %></label>
      		<br/><br/>
      		</div>
      		
      		 <div class="input-field">
      		<i class="material-icons prefix">mode_edit</i>
      		<input id="LastName" type="text">
      		<label for="LastName"><%out.println("Apelido: "+ student.getLastName()); %></label>
      		<br/><br/>
      		</div> 
    		
    		<div class="input-field">
      		<i class="material-icons prefix">mode_edit</i>
      		<input id="Contacto" type="text">
      		<label for="Contacto"><%out.println("Contacto: "+ student.getContacto()); %></label>
      		<br/><br/>
      		</div>
      		
      		<input type="hidden" id="StudentID" name="custId" value=<%out.println(student.getIdentifier()); %>>
      		
      		<form method="post" name="Modificar" onsubmit="return checkform(this);" >    
    		<button class="btn waves-effect waves-light" type="submit" name="action">Modificar
        		<i class="material-icons right">send</i>
      		</button>
    		</form>    
    		<br/>
    	</div> 
      </div>
    </div>
</div>           
            
    
    
 
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript" src="js/modificaraluno.js"></script>
 

</body>
</html>