function checkform ( form )
{
	var TeacherID = document.getElementById("TeacherID").value;
	var TeacherNumber = document.getElementById("TeacherNumber").value;
	var FirstName = document.getElementById("FirstName").value;
	var LastName = document.getElementById("LastName").value;
	var Contacto = document.getElementById("Contacto").value;
	var Password = document.getElementById("Password").value;
	
	form.action="handlemodificarprofessor.jsp?teacherNumber="+TeacherNumber+"&FirstName="+FirstName+"&LastName="+LastName+"&Contacto="+Contacto+"&TeacherID="+TeacherID+"&Password="+Password;
	
}