function checkform ( form )
{
	var StudentID = document.getElementById("StudentID").value;
	var StudentNumber = document.getElementById("StudentNumber").value;
	var FirstName = document.getElementById("FirstName").value;
	var LastName = document.getElementById("LastName").value;
	var Contacto = document.getElementById("Contacto").value;
	
	form.action="handlemodificaraluno.jsp?StudentNumber="+StudentNumber+"&FirstName="+FirstName+"&LastName="+LastName+"&Contacto="+Contacto+"&StudentID="+StudentID;
	
}