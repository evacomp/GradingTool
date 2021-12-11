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

	<% session.getAttribute("turma");
String code=(String)session.getAttribute("code");
out.println(code);
session.getAttribute("username");
String turmaid= (String) session.getAttribute("turmaid");
int classid = Integer.parseInt(turmaid);
String requested =(String) request.getParameter("ids");
String evidencias= (String) request.getParameter("Evidencias");
String skillsid= (String) request.getParameter("skillsidh");
int skillsID= Integer.parseInt(skillsid);

if (requested.length()>0) {
	if(requested!=null){ 
	String [] ids = requested.split(",");
	for (int i=0; i<ids.length; i++) {
			if(!ids[i].isEmpty()){
				State.getInstance().setAprendizagemAtingida(code, Integer.parseInt(ids[i]), true, evidencias, classid, skillsID);
				out.println(ids[i]);
			}
		
	}
	}
}


String toDelete=(String) request.getParameter("idsUnchecked");
if(toDelete.length()>0 ){
	if(toDelete !=null){
	String [] idsRemove= toDelete.split(",");
	out.println("to remove");
	for (int j=0; j<idsRemove.length; j++) {
		if(!idsRemove[j].isEmpty()){
			State.getInstance().setAprendizagemAtingida(code, Integer.parseInt(idsRemove[j]), false, "", classid, skillsID);
			out.println(idsRemove[j]);
		}
	}
	}
}


response.sendRedirect("aprendizagens.jsp");


%>

</body>

</html>