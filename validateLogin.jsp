<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.State" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<% 
      	if (State.getInstance().teachervalidateLogin(request.getParameter("username"),request.getParameter("password")) == true){
			session.setAttribute("username",request.getParameter("username"));
			response.sendRedirect("home.jsp");
		}
		 else {
			response.sendRedirect("InvalidLogin.jsp");
		}
       		%>

</body>
</html>