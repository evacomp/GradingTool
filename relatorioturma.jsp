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
          <li><a href="home.html">As Minhas Turmas</a></li>
           <li><a href="adminIndex.jsp"> Admin</a></li>
          <li> 
         		<% out.println(session.getAttribute("username"));%>
         </li>
          <li><a href="index.jsp"> </a></li>
          <li></li>
        </ul>
      </div>
    </nav>
    <br/>

    <br/>
    <h3> Aluno</h3>
    
    <div class="row">
    		<%List<Turma> turmas= State.getInstance().getAllTurmas(); %>
    		<div id="Turma" class="input-field col s12 m4">
          		<label></label>
          		<select>
          		<option value = "0" disabled selected></option>
          		<%for(int i=0; i<turmas.size(); i++){ %>
            		<option value =<%out.println(turmas.get(i).getIdentifier()); %>> <%out.println(turmas.get(i).toString()); %></option>
            	<%} %>
        		</select>
        		<label for="Turma">Turma</label>
       		</div>
    	</div>
    </div>
    
   <form method="post" name="CIA" onsubmit="return checkform(this);" >
    <button class="btn waves-effect waves-light" type="submit" name="action">Selecionar
        	<i class="material-icons right">send</i>
      </button>
	</form>
    <br/><br/>
    

<!--JavaScript at end of body for optimized loading-->
  <script type="text/javascript" src="js/relatorioturma.js"></script>

</body>
</html>