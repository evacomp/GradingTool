<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DRA</title>
<link rel="stylesheet" href="./css/styles.css">
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
</head>
<body>
	

    <br/><br/>
    
    <div class="row">
    <div class="col s3 m4"></div>
    <div class="col s8 m3">
      <div class="card-panel teal">
        	<div id="loginform" class="login">	
				<form name="login" method="post"  action="validateLogin.jsp">	
					<p> Username:<input name="username" type="text" id="username"></p>
					<p>Password:<input name="password" type="password" id="password"></p>
					<input type="submit" name="Submit" value="Entrar">
				</form>
			</div>
      </div>
    </div>
  </div>
    
	
</body>
</html>