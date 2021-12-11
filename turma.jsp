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

    <br/><br/><br/>

    <div class="row">
      <div class="col s2">
        <div class="card-panel teal">
          <form>
            <h4> CIAs <br/></h4> </br/>
            <div class="row">
              <div class="col s3">
              </div>
              <div class="col s5">
              <!--  <a href="CIASTurma.jsp" class="tealButtonDarker4 "> Editar </a> -->  <a href="" class="tealButtonDarker4 "> Em breve </a>
              </div>
            </div>
          </form>
        </div>
      </div>
      <%
      String id = (String)session.getAttribute("turmaid");
      int turmaid;
      try {
    	  turmaid = Integer.parseInt(id); 
    	  
      }catch(NumberFormatException ex){
    	  turmaid =0;
    	  out.println("Não conseguimos a lista de alunos. Contactar Assistência.");
      }
      %>
      <% List<Student> students = State.getInstance().getStudentsByClassID(turmaid); %> 
      <div class="col s6">
        <table>
        <tr>
            <th>Alunos</th>
            <th> Aprendizagens adquiridas </th>
          </tr>
        <%
        Iterator<Student> studentIterator = students.iterator();
        Student student;
		while (studentIterator.hasNext()) {
				student= studentIterator.next(); %>
          <tr>
            <td><%out.println(student.getName());%></td>
            <td class="range-field">
              <input disabled type="range" min="0" max="100" value="<%out.print(State.getInstance().getTotalNbrAprendizagensAtingidas(student.getIdentifier())); %>" />
            </td>
          </tr>
          <%}%>
        </table>
        
    </div>
    <div class="col s2">
          <a href="aprendizagens.jsp" class="tealButton" id="editar"> Editar </a>
    </div>

</div>


<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>

</body>
</html>