function checkform ( form )
{
	var ano = document.getElementById("Ano").value;
	var codigo = document.getElementById("Codigo").value;
	var disciplina = document.getElementById("Disciplina").value;

	var ciclo="";
	var cicloList= $('#Ciclo option:selected');
	for (var i = 0; i <cicloList.length; i++) {
		ciclo= cicloList[i].value;
	}
	
	var professor="";
	var professorList= $('#Professores option:selected');
	for (var i = 0; i <professorList.length; i++) {
		professor= professorList[i].value;
	}
	
	
	form.action="handlenewclass.jsp?ano="+ano+"&codigo="+codigo+"&disciplina="+disciplina+"&ciclo="+ciclo+"&professor="+professor;
	
}