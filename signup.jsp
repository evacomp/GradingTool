<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DRA</title>
</head>
<body>
	<h1>Sign Up</h1>
	
	<form action="<%=request.getContextPath()%>/StartUpController" method="post">
		Username <input type="text" name="name" /> <br/>
		
		Disciplinas <select  multipe name="disciplinas">
						<option value="Português" > Português </option>
							<option value="Matematica"> Matemática </option>
					</select>
	</form>
</body>
</html>