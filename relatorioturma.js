function checkform ( form )
{
	var turma="";
	var turmaList= $('#Turma option:selected');
	for (var i = 0; i <turmaList.length; i++) {
		turma= turmaList[i].value;
	}
	
	form.action="handlerelatorioturma.jsp?turma="+turma;
	
}