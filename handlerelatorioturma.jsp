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
</head>
<body>

<% 
if(request.getParameter("turma")!=null)
	session.setAttribute("turmaid",request.getParameter("turma"));
else
	session.getAttribute("turma");
%>
<%
   String id = (String)session.getAttribute("turmaid");
%>
    
    <%
    String turma=(String) request.getParameter("turma");
    int classid= Integer.parseInt(turma);
   	out.println("<h3>"+State.getInstance().turmabyTurmaID(classid)+"</h3>");
    List <Student> students = State.getInstance().getStudentsByClassID(classid);
	List<Skill> skills;
    Iterator<Student> studentIterator = students.iterator();
    Iterator<Skill> skillIterator;
    Student student;
    Skill skill;
    String code;
    boolean hasSkill;
    %>
    <table>
    <%
    while (studentIterator.hasNext()) {
    	out.println("<tr>");
    	student=studentIterator.next();
    	out.println("<td><b>"+student.getFirtsName()+" "+ student.getLastName()+"</b></td>");
    	out.println("</tr>");
    	skills= State.getInstance().getSkillsbyClass(classid);
    	skillIterator= skills.iterator();
    	while(skillIterator.hasNext()){
    		out.println("<tr>");
    		skill=skillIterator.next();
    		code=skill.getSkillCode();
    		out.println("<td>"+code+"</td>");
    		hasSkill=State.getInstance().studentHasSkill(code, student.getIdentifier());
    		if(hasSkill)
    			out.println("<td> Aprendizagem Efetuada</td>");
    		else
    			out.println("<td> Aprendizagem por concretizar </td>");
    		out.println("</tr>");
    	}
    }
	%>
	</table>
    



</body>
</html>