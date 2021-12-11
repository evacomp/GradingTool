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
    if(request.getParameter("turma")!=null)
    	session.setAttribute("turmaid",request.getParameter("turma"));
    else
    	session.getAttribute("turma");
    %>
        
        <%
        String TeacherNumber=(String) request.getParameter("teacherNumber");
        int teacherNumber=0;
        if(TeacherNumber!= null && !TeacherNumber.isBlank())
        	teacherNumber= Integer.parseInt(TeacherNumber);
        String FirstName=(String) request.getParameter("FirstName");
        String LastName=(String) request.getParameter("LastName");
        String Contacto=(String) request.getParameter("Contacto");
        String TeacherID=(String) request.getParameter("TeacherID");
        String Password=(String) request.getParameter("Password");
        int teacherID=0;
        if(!TeacherID.isBlank())
        	teacherID= Integer.parseInt(TeacherID);
          	
        State.getInstance().updateTeacher(teacherID, teacherNumber, FirstName, LastName, Contacto);
        
        if(!Password.isBlank())
        	State.getInstance().updatePassword(teacherID, Password);
       
        response.sendRedirect("adminIndex.jsp");%>
        



    </body>
    </html>