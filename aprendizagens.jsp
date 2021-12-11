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
<% session.getAttribute("turma"); %>

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
        <div class="nav-wrapper">
        	<%
      		String id = (String)session.getAttribute("turmaid");
      		int turmaid;
      		try {
    	  		turmaid = Integer.parseInt(id); 
    	  
     		 }catch(NumberFormatException ex){
    	  		turmaid =0;
    	  		out.println("Não conseguimos o id da turma. Por favor tente mais tarde.");
      		}
      		Turma turma = State.getInstance().turmabyTurmaID(turmaid);
      		%>
            <h5 class="right-align"><a class="TurmaTag" href="turma.jsp"> <% out.println(turma.getYearCode()); %> <br/>  <% out.println(turma.getSubject()); %></a></h5>
      </div>
    </nav>
    <br/>

    <br/><br/><br/>
        <table>
          <tr>
            <th> Unidade Curricular</th>
            <th> Código Apr. </th>
            <th> Aprendizagens Chave</th>
            <th> Alunos c/ Aprendizagens <br/> Chave Atingida?</th>
            <th> Áreas de Competência </th>
            <th> </th>
          </tr>
          <%//List<Skill> skills= State.getInstance().getSkillsbyClass(turmaid);
          List<Skill> skills=State.getInstance().getSkillsbyClass(turmaid);
          for(int i=0; i<skills.size(); i++){%>
          <tr>
            <td><%out.println( skills.get(i).getCurricularUnit()); %></td>
            <td><%out.println( skills.get(i).getSkillCode()); %></td>
            <td> <%out.println( skills.get(i).getSkillDescription()); %></td>
            <td> <%boolean b= State.getInstance().classHasSkill(skills.get(i).getSkillCode(), turmaid);
            		if(b){
            			out.println("Sim");
            		}else{
            			out.println("Não");
            		}%></td>
            <td><%out.println( skills.get(i).getCurricularUnit()); %></td>
            <%
            String code=skills.get(i).getSkillCode();
            int skillsid= skills.get(i).getId();
            String URL="atribuirAprendizagens.jsp?code="+code+"&skillsid="+skillsid; %>
            <td> <a href=<%out.println(URL);%> class="TurmaTag" > Actualizar  Aprendizagens </a> </td>
          </tr>
          <%} %>
        </table>
        <br/>
        <form method="get" action="turma.jsp">
        	<input class="btn waves-effect waves-light"  type="submit" name="Voltar" value="Voltar Lista Alunos">
         </form>

<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>