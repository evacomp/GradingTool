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
<% session.setAttribute("code",request.getParameter("code")); %>

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
    	  		out.println("Não conseguimosa a id da turma. Ligue para a assistência.");
      		}
      		Turma turma = State.getInstance().turmabyTurmaID(turmaid);
      		%>
            <h5 class="right-align"><a class="TurmaTag" href="turma.jsp"> <% out.println(turma.getYearCode()); %> <br/> Matemática </a></h5>
      </div>
    </nav>
    <br/>

    <br/><br/><br/>
    
      
      <div class="row">
      <div class="col s5">
      <%String URL=""; %>
       
        <table>
         <% List<Student> students = State.getInstance().getStudentsByClassID(turmaid); %> 
          <tr>
            <th>Alunos To Do</th> 
            <th> Selecionar alunos </th>
          </tr>
       <%
        String code = (String)session.getAttribute("code");
		Skill skill= State.getInstance().getSkillbyCode(code); 
        Iterator<Student> studentIterator = students.iterator();
        Student student;
        String idstoPass="";
        boolean isTicked;
		while (studentIterator.hasNext()) {
			student=studentIterator.next();
			isTicked=State.getInstance().studentHasSkill(code, student.getIdentifier());
		%>
          <tr>
            <td><%out.println(student.getName());%></td>
            <td>
             
                  <p>
                    <label>
                    <%
                    idstoPass=idstoPass+student.getIdentifier()+",";
                    String ide="aprendizagensCheck"+student.getIdentifier();
                    if(isTicked){
                    	out.println("<input type='checkbox' id='"+ide+"' class='filled-in' checked='checked' />");
                    	
                    }
                    else {
                    	out.println("<input type='checkbox' id='"+ide+"'/>");
                    }
                    %>
                      
                      <span></span>
                    </label>
                  </p>
                  
            </td>
          </tr>
        <%}%>  
        </table>
        
        <br/>
       
        
      </div>
      <div class="col s1"> </div>
      <div class="col s6">
        <table>
          <tr>
            <th> Unidade Curricular</th>
            <th> Código Apr. </th>
            <th> Aprendizagem Chave</th>
            <th> Área de Competência </th>
          </tr>
          <%
          	String aprendizagem = "", disciplina="", areaCompetencia="", codigo="";
				if(skill!=null){
					aprendizagem= skill.getSkillDescription();
					disciplina= skill.getCurricularUnit();
					codigo=skill.getSkillCode();
					areaCompetencia= skill.getComptenceArea();
				}
			
			%>
          	<tr>
            	<td><%out.println(disciplina);%>a</td>
            	<td> <%out.println(codigo);%></td>
            	<td><%out.println(aprendizagem);%></td>
            	<td><%out.println(areaCompetencia);%></td>
            </tr>

          
        </table>
        <br/>
        
        <textarea id="Evidencias" class="materialize-textarea"></textarea>
          <label for="Evidencias">Evidências/Obs.</label>
          
          <br/><br/>
          
        <br/> <p><a onclick="selectAll ()" class="TurmaTag"> Selecionar Todos</a></p><br/>
        
        <br/> 
        
         <form method="post" onsubmit="return checkform(this);">
        <input class="btn waves-effect waves-light"  type="submit" name="ConfeririAprendizagens" value="Actualizar Aprendizagens">
         </form>
         <br/><b>Nota: Por favor confira os alunos selecionados e insira os comentários necessários no campo das evidências antes de actualizar as aprendizagens</b>
   		<input type="hidden" id="skillsidhidden" value="<%out.println(request.getParameter("skillsid"));%>">
    </div>
    </div>
    
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript" src="js/atribuirAprendizagens.js"></script>
</body>
</html>