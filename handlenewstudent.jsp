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
    String nraluno=(String) request.getParameter("nraluno");
    int nbrAluno = Integer.parseInt(nraluno);
    String pNome=(String) request.getParameter("pNome");
    String uNome=(String) request.getParameter("uNome");
    String contacto=(String) request.getParameter("contacto");
    String turmaAluno=(String) request.getParameter("turma");
    int classid= Integer.parseInt(turmaAluno);
    State.getInstance().insertstudent(nbrAluno, pNome, uNome, contacto, classid);
    response.sendRedirect("adminIndex.jsp");%>
    



</body>
</html>