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
 session.setAttribute("skills",request.getParameter("skills"));
 String skillsString=(String) request.getParameter("skills");
 String[] skills= skillsString.split(",");
 Turma[] turmas=null;
 String id;
 if(skills.length>0){
	 turmas= State.getInstance().turmasbyTeacher((String)(session.getAttribute("username"))); 
	 for( int t=0; t< turmas.length; t++) {
	 	id="turma"+turmas[t].getIdentifier();%>
	<p>
	 <label>	
    	<input id="<%out.println(id);%>" type="checkbox"  value="<%out.println(turmas[t].getIdentifier()); %>"/>
    	<% out.println("<span class='teal-text'>"+turmas[t].getYearCode()+" "+ turmas[t].getSubject()+"</span>"); %>
    </label>
    </p>
  <%}
 }
 %>
 
 <%if(skills.length==0){
	     response.sendRedirect("adminIndex.jsp");
 }%>
  

  <form method="post" name="AdicionarAprendizagensTurmas" onsubmit="return checkform(this);" >
    	<button class="btn waves-effect waves-light" type="submit" name="action">Adicionar Aprendizagem a Turmas
        	<i class="material-icons right">send</i>
      </button>
  </form> 
 
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript">
function checkform ( form , nrTurmas)
{
	var turmas="";
	var inputs= document.querySelectorAll('*[id^="turma"]');
	
	for(var i = 0; i < inputs.length; i++) {
		if(inputs[i].checked){
			turmas= turmas+inputs[i].value+ ",";
		}
	   
	}
	form.action="handleaprendizagenstoturmas.jsp?turmas="+turmas;
	
}

</script>

 

</body>
</html>