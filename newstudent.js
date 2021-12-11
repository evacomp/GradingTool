function checkform ( form )
{
	var nraluno = document.getElementById("NrAluno").value;
	var pNome = document.getElementById("PNome").value;
	var uNome = document.getElementById("UNome").value;
	var contacto = document.getElementById("contacto").value;
	var turma="";
	var turmaList= $('#Turma option:selected');
	for (var i = 0; i <turmaList.length; i++) {
		turma= turmaList[i].value;
	}
	
	form.action="handlenewstudent.jsp?nraluno="+nraluno+"&pNome="+pNome+"&uNome="+uNome+"&contacto="+contacto+"&turma="+turma;
	
}