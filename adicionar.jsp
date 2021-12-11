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
    
<% String nr= request.getParameter("nr");
int nrAluno= Integer.parseInt(nr);

Student student= State.getInstance().getStudentByStudentNr(nrAluno);

%>  
 
 <div class="row">
  <div class="col s4"> 
	<div class="card teal darken-1">
        <div class="card-content white-text">
          <span class="card-title"> <%out.println(student.getFirtsName()+ " "+ student.getLastName()); %> </span>
    		<br/>
    		<p > Student Number: <%out.println(student.getStudentNumber()); %> </p> 
    		 <input type="hidden" id="nraluno" value="<%out.println(student.getStudentNumber()); %>">
    		<% List <Turma> sturmas = student.getTurmas(); 
    		for(int i=0; i< sturmas.size(); i++) {
    			out.println("<p> "+ sturmas.get(i).toString()+"</p>");
    		}
    		%>
        </div>
	</div>
  </div>
</div>
 
 
 
   
<%List<Turma> turmas= State.getInstance().getAllTurmas(); %>
	<div class="row">
    	<div class="col s4">
    		<div id="Turma" class="input-field col s12">
          		<label></label>
          		<select multiple>
          		<option value = "0" disabled selected></option>
          		<%for(int i=0; i<turmas.size(); i++){ %>
            		<option value =<%out.println(turmas.get(i).getIdentifier()); %>> <%out.println(turmas.get(i).toString()); %></option>
            	<%} %>
        		</select>
        		<label for="Turma">Grupos</label>
       		</div>     
       	</div>
       	
       	<div class="col s4">
       		<form method="post" name="Adicionar" onsubmit="return checkform(this);" >
    <button class="btn waves-effect waves-light" type="submit" name="action">Adicionar
        	<i class="material-icons right">send</i>
      </button>
	</form>
       	</div>
 	</div>
 	
 	
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript">
function checkform ( form )
{
	var nraluno = document.getElementById("nraluno").value;
	var turmalist="";
	var turmaList= $('#Turma option:selected');
	for (var i = 0; i <turmaList.length; i++) {
		turmalist= turmalist +","+ turmaList[i].value;
	}
	
	form.action="handleadicionar.jsp?turmaList="+turmalist+"&nraluno="+nraluno;
	
}
</script>

</body>
</html>