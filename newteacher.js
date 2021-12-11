function checkform ( form )
{
	var nrProfessor = document.getElementById("NrProfessor").value;
	var Username = document.getElementById("Username").value;
	var pNome = document.getElementById("PNome").value;
	var uNome = document.getElementById("UNome").value;
	var password = document.getElementById("password").value;
		
	var radios = document.getElementsByName('isAdminstrator');
	var adminstrator="no";

	for (var i = 0, length = radios.length; i < length; i++)
	{
	 if (radios[i].checked)
	 {
	  adminstrator="yes";
	  break;
	 }
	}
	
	
	form.action="handlenewteacher.jsp?nrProfessor="+nrProfessor+"&pNome="+pNome+"&uNome="+uNome+"&password="+password+"&adminstrator="+ adminstrator+"&Username="+Username;
	
}