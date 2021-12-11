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
 
  	
  <%List<Skill> skills= State.getInstance().getTemplateSkills();
  
 %> 
  <table class="striped responsive-table">
  	<thead>
  		<tr>
  			<th>
  				Unidade Curricular 
  			</th>
  			<th>
  				Código Aprendizagem
  			</th>
  			<th>
  				Aprendizagem Chave
  			</th>
  			<th>
  				Área de Competência
  			</th>
  			<th>
  			Adicionar?
  			</th>
  		</tr>
  	</thead>
  	<tbody><% 
  	for(int i=0; i< skills.size(); i++){%>
	  <tr>
	  	<td><%out.print(skills.get(i).getCurricularUnit()); %></td>
	  	<td><%out.print(skills.get(i).getSkillCode()); %></td>
	  	<td><%out.print(skills.get(i).getSkillDescription()); %></td>
	  	<td><%out.print(skills.get(i).getComptenceArea()); %></td>
	  	<td> 
	  		<p>
      			<label>
      				<%String id="skillsid"+i; %>
      				<%String skillcode="skillcode"+i; %>
      				<input id=<%out.println(skillcode); %> type="hidden" value=<%out.print(skills.get(i).getSkillCode()); %> />
      				<input id=<%out.println("skills"+i); %> type="hidden" value=<%out.print(skills.get(i).getId()); %> />
        			<input id=<%out.println(id); %> type="radio" />
        			<span></span>
      			</label>
   			 </p>
	  	</td>
	  </tr>
 <% }%>
  	
  	</tbody>
  </table>

  <form method="post" name="AdicionarAprendizagens" onsubmit="return checkform(this,<%out.print(skills.size()); %>);" >
    	<button class="btn waves-effect waves-light" type="submit" name="action"> Adicionar Aprendizagem
        	<i class="material-icons right">send</i>
      </button>
  </form> 
  

 
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript">

function checkform ( form , nrSkills)
{
	var skills="";
	var skillsid="";
	
	for(s=0; s<nrSkills; s++){
		if(document.getElementById("skillsid"+s).checked) {
			skills= skills+ document.getElementById("skillcode"+s).value+",";
			skillsid= skillsid+ document.getElementById("skills"+s).value+",";
		}
		
	}
	
	form.action="handleaprendizagem.jsp?skills="+skills+"&skillsid="+skillsid;
	
}

</script>
 

</body>
</html>