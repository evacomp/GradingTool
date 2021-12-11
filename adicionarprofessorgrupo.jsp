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
    
    Adicionar <% out.println(session.getAttribute("username"));%> a grupo: <br/>
    
   
   <form method="post" name="Prof" onsubmit="return checkform(this);">

      <%List<Turma> turmas= State.getInstance().getAllTurmas();
    for(int i=0; i< turmas.size(); i++) { 
    	out.println("<p><label>");
    	out.println("<input class='with-gap' name='group1' value='"+turmas.get(i).getIdentifier()+"' type='radio'/>");
    	out.print("<span>"+turmas.get(i).getYearCode()+" "+ turmas.get(i).getSubject()+"</span>");
    	out.println("</label> </p>");
    }
    %>
        <button class="btn waves-effect waves-light" type="submit" name="action">Adicionar
        	<i class="material-icons right">send</i>
      </button>


  </form>
    


            
            
    
    
 
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript" src="js/adicionarprofessorgrupo.js"></script>
 

</body>
</html>