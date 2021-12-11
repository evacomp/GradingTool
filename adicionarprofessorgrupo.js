function checkform ( form )
{

	var radios = document.getElementsByName('group1');
	var turma="";
	for (var i = 0, length = radios.length; i < length; i++)
	{
	 if (radios[i].checked)
	 {
	  turma=radios[i].value
	  break;
	 }
	}
	

	form.action="handleadicionarprofessorgrupo.jsp?turma="+turma;
	
}