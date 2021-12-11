<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.*" %>
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
          <li><a href=""> Placeholder 1</a></li>
          <li> 
         		<% out.println(session.getAttribute("username"));%>
         </li>
          <li><a href="index.html"> </a></li>
          <li></li>
        </ul>
      </div>
        <div class="nav-wrapper">
        	<%
      		String id = (String)session.getAttribute("turmaid");
      		int turmaid;
      		try {
    	  		turmaid = Integer.parseInt(id); 
    	  
     		 }catch(NumberFormatException ex){
    	  		turmaid =0;
    	  		out.println("Não conseguimosa a id da turma. Ligue para a assistência.");
      		}
      		Turma turma = State.getInstance().turmabyTurmaID(turmaid);
      		%>
            <h5 class="right-align"><a class="TurmaTag" href="turma.jsp"> <% out.println(turma.getYearCode()); %> <br/> Matemática </a></h5>
      </div>
    </nav>
    <br/>

    <br/><br/><br/>
    <h3> Cenários Integradores de Aprendizagem </h3>
    
    <div class="input-field">
      <i class="material-icons prefix">mode_edit</i>
      <input id="Titulo" type="text">
      <label for="Titulo">Título</label>
      <br/><br/>
    </div>

    <div class="input-field">
      <i class="material-icons prefix">mode_edit</i>
      <input id="Resumo" type="text">
      <label for="Resumo">Resumo</label>
      <br/><br/>
    </div>

    <div class="DisciplinasAprendizagens1 input-field">
      <div class = "row">
        <div class="input-field col s12 m4">
          <select id="DisciplinasDD" onchange="showlAllAprendizagens()">
                <option value = "0" disabled selected></option>
                <option value= "Matematica"> Matemática</option>
                <option value= "Portugues"> Português</option>
                <option value= "Ciencias"> Ciências</option>
          </select>
          <label for="DisciplinasDD">Disciplinas</label>
        </div>
        <div id="AprendizagensDD" class="input-field col s12 m4">
          <label></label>
          <select  multiple>
            <option value = "0" disabled selected></option>
            <option value = "Aprendizagem 1">Aprendizagem 1</option>
            <option value = "Aprendizagem 2 ">Aprendizagem 2</option>
            <option value = "Aprendizagem 3">Aprendizagem 3</option>
        </select>
        <label for="AprendizagensDD">Aprendizagens</label>
       </div>
    </div>
    <div class="buttonDisciplinasAprendizagens1 right-align">
      <button class="btn waves-effect waves-light" type="submit" name="action" onclick="disciplinas()"> Outra Disciplina
        <i class="material-icons">add_to_queue</i>
      </button>
      <br/>
    </div>
   </div>

   <div id="DisciplinasAprendizagens2" class="input-field">
     <div class = "row">
       <div class="input-field col s12 m4">
         <select id="DisciplinasDD2" onchange="showlAllAprendizagens()">
             <option value = "0" disabled selected></option>
             <option value= "Matematica"> Matemática</option>
             <option value= "Portugues"> Português</option>
             <option value= "Ciencias"> Ciências</option>
         </select>
         <label for="DisciplinasDD">Disciplinas</label>
       </div>
       <div id="AprendizagensDD2" class="input-field col s12 m4">
         <label></label>
         <select  multiple>
           <option value = "0" disabled selected></option>
           <option value = "1">Aprendizagem 1</option>
           <option value = "2">Aprendizagem 2</option>
           <option value = "3">Aprendizagem 3</option>
       </select>
       <label for="AprendizagensDD">Aprendizagens</label>
      </div>
   </div>
  </div>



    <br/>
    <div class="input-field">
      <i class="material-icons prefix">mode_edit</i>
      <textarea id="Guiao" class="materialize-textarea"></textarea>
      <label for="Guiao">Guião</label>
    </div>


    <br/><br/> 
   <form method="post" name="CIA" onsubmit="return checkform(this);" >
    	<button class="btn waves-effect waves-light" type="submit" name="action">Guardar
        	<i class="material-icons right">send</i>
      </button>
     </form>

<!--JavaScript at end of body for optimized loading-->
  <script type="text/javascript" src="js/CIA.js"></script>
</body>
</html>