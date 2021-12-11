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
    <%List<CIA> cias= State.getInstance().getCIAS(turmaid); %>
    <h3> Cenários Inegradores da Aprendizagem </h3>
    <table>
      <tr>
        <th>
           Titulo
        </th>
        <th>
          Resumo
        </th>
        <th>
          Disciplinas
        </th>
      </tr>
      <%for(int i=0; i<cias.size();i++){ %>
      <tr>
        <td>
          <%
          int ciaid=cias.get(i).getCiaid();
          String URL="CIA.jsp?ciaid="+ciaid; %>
          <a href=<%out.println(URL); %> class="TurmaTag"> Titulo </a>
        </td>
        <td>
          <% out.println(cias.get(i).getResumo()); %>
        </td>
        <td>
          <%
          String[] disciplinasApren= cias.get(i).getDisciplinaAprendizagens();
          String[] aux; 
          String disciplinas="";
          for (int m=0; m<disciplinasApren.length; m++){
        	  aux=disciplinasApren[m].split(",");
        	  disciplinas= disciplinas + aux[0]+ ", ";
        	  disciplinas=disciplinas.replaceAll("\\(", "");
          }
          int length= disciplinas.length();
          disciplinas=disciplinas.substring(0, length-2);
          out.println(disciplinas);           
          %>
        </td>
      </tr>
     <%} %>
    </table>
    <br/>
    <form name="CIA" method="post"  action="novoCIA.jsp">	
    	<button class="btn waves-effect waves-light" type="submit" name="action"> Novo CIA
        <i class="material-icons right">send</i>
      </button>
    </form>
    
     



<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>