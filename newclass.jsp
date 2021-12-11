<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FCDRA</title>
     <link rel="stylesheet" href="./css/styles.css">
      <meta name = "viewport" content = "width = device-width, initial-scale = 1">
      <link rel = "stylesheet"
         href = "https://fonts.googleapis.com/icon?family=Material+Icons">
      <link rel = "stylesheet"
         href = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
      <link rel="stylesheet" href="./css/styles.css">
      <script type = "text/javascript"
         src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script src = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js">
      </script>

      <script>
         $(document).ready(function() {
            $('select').material_select();
         });
      </script>
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

    <br/>
    <h3> Novo Grupo</h3>
    

    <div class="row">
    	<div class="col s6">
    	<div class="input-field">
      		<i class="material-icons prefix">mode_edit</i>
      		<input id="Ano" type="text">
      		<label for="Ano">Ano</label>
      		<br/><br/>
    	</div>
    	<div class="input-field">
      		<i class="material-icons prefix">mode_edit</i>
      		<input id="Codigo" type="text">
      		<label for="Codigo">Código</label>
      		<br/><br/>
   		</div>
   		<div class="input-field">
      		<i class="material-icons prefix">mode_edit</i>
      		<input id="Disciplina" type="text">
      		<label for="Disciplina">Disciplina</label>
      		<br/><br/>
   		</div>
   		<div id="Ciclo" class="input-field col s12 m4">
          <label></label>
          <select>
            <option value = "0" disabled selected></option>
            <option value = "Pre"> Pré-escolar</option>
            <option value = "1 ">1º ciclo </option>
            <option value = "2"> 2º ciclo</option>
            <option value = "3"> 3º ciclo</option>
        </select>
        <label for="Ciclo">Ciclo</label>
       </div>
       
       <%List<Teacher> teachers= State.getInstance().getAllTeachers();%>
       
       <div id="Professores" class="input-field col s12">
          <label></label>
          <select >
            <option value = "0" disabled selected></option>
           <%for(int i=0; i<teachers.size();i++) {  %>
            <option value = "<%out.println(teachers.get(i).getId());%>"> <%out.println(teachers.get(i).getFirtName()+" "+ teachers.get(i).getLastName()); %></option>
          <%} %>
        </select>
        <label for="Professores">Professores</label>
       </div>
      </div>
     </div> 
	    
    	
<form method="post" name="Class" onsubmit="return checkform(this);" >    
    <button class="btn waves-effect waves-light" type="submit" name="action">Novo Grupo
        	<i class="material-icons right">send</i>
      </button>
    </form>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/newclass.js"></script>

</body>
</html>