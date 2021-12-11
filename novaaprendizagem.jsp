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
 
  	
  	<div class="input-field">
      <i class="material-icons prefix">mode_edit</i>
      <input id="UnidCurricular" type="text">
      <label for="UnidCurricular">Unidade Curricular</label>
      <br/><br/>
    </div>
    
    <div class="input-field">
      <i class="material-icons prefix">mode_edit</i>
      <input id="CodigoApren" type="text">
      <label for="CodigoApren">Código Aprendizagens</label>
      <br/><br/>
    </div>
  	
  	<div class="input-field">
      <i class="material-icons prefix">mode_edit</i>
      <input id="AprenChave" type="text">
      <label for="AprenChave">Aprendizagen Chave</label>
      <br/><br/>
    </div>
    
    <div class="input-field">
      <i class="material-icons prefix">mode_edit</i>
      <input id="AreaCompetencia" type="text">
      <label for="AreaCompetencia">Área de Competência</label>
      <br/><br/>
    </div>
            
  <form method="post" name="AdicionarAprendizagens" onsubmit="return checkform(this);" >
    	<button class="btn waves-effect waves-light" type="submit" name="action">Adicionar Aprendizagem
        	<i class="material-icons right">send</i>
      </button>
  </form>          
            
    
    
 
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript">
function checkform ( form )
{
	var UnidCurricular= document.getElementById("UnidCurricular").value;
	var CodigoApren = document.getElementById("CodigoApren").value;
	var AprenChave = document.getElementById("AprenChave").value;
	var AreaCompetencia = document.getElementById("AreaCompetencia").value;
		
	form.action="handlenovaaprendizagem.jsp?UnidCurricular="+UnidCurricular+"&CodigoApren="+CodigoApren+"&AprenChave="+AprenChave+"&AreaCompetencia="+AreaCompetencia;
	
}

</script>