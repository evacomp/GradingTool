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
    
    <%
    String resumo=(String) request.getParameter("resumo");
    String DisciplinasAprendizagens=(String) request.getParameter("disciplinasAprendizagens");
    String guiao=(String) request.getParameter("guiao");
    String titulo=(String) request.getParameter("titulo");
    
    String [] disciApren= DisciplinasAprendizagens.split(";");
    String [] aprendaux= new String[5];
    String [] disciplinas= new String[2];
    String disciplina;
    String [] [] aprendizagens= new String[2][5];
    int divider=0;
    
    //Left Here
    for(int i=0; i<disciApren.length;i++ ){
    	divider=disciApren[i].lastIndexOf(":");
    	disciplina=disciApren[i].substring(0, divider);
    	disciplinas[i]=disciplina;
    	aprendaux=disciApren[i].split(",");
    	
    	aprendizagens= new String[2][aprendaux.length];
    	for(int m=0; m<aprendaux.length;m++){
    		aprendizagens[i][m]=aprendaux[m];
    	}
    }
   
    
    
    //State.getInstance().insertCIA(resumo, disciplinas, aprendizagens, guiao, titulo, turmaid);
    //response.sendRedirect("CIASTurma.jsp");%>



</body>
</html>