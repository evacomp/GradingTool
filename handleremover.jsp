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
   
   
   <%String turmaList= (String) request.getParameter("turmaList");
   String [] turmasaux= turmaList.split(",");
   List<Integer> turmas = new ArrayList();
   for(int i=0; i<turmasaux.length; i++) {
	   if(!turmasaux[i].contentEquals("0")) {
		   if(!turmasaux[i].isEmpty()){
			   turmas.add(Integer.parseInt(turmasaux[i]));
		   }	   
	   }   
   }
   String nrAluno= (String) request.getParameter("nraluno");
   int studentnr=Integer.parseInt(nrAluno);

 	State.getInstance().deleteStudentFromTurmas(turmas, studentnr);
 	
 	response.sendRedirect("adminIndex.jsp");%>
   

<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>

 

</body>
</html>