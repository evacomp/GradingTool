//document.getElementsByClassName("addDisciplinaNuclear")[0].onclick = $(document).onclick(function() {
//  var disciplinasNucleares = document.querySelector(".DisciplinasNucleares").innerHTML;
  //var newRow = document.querySelector(".NuclearRow").innerHTML;
  //disciplinasNucleares.append(newRow);
//document.getElementById("addDisciplinasNucleares").innerHTML += disciplinasNucleares;
//});

/*function addDisciplinaNuclear() {
  var disciplinasNucleares = document.querySelector(".DisciplinasNucleares").innerHTML;
  document.getElementById("addDisciplinasNucleares").innerHTML += disciplinasNucleares;
}*/

$(document).ready(function() {
  var x = document.getElementById("DisciplinasAprendizagens2");
  x.style.display = "none";
});

//Show Disciplinas 2 block
function disciplinas(){
  var x = document.getElementById("DisciplinasAprendizagens2");
  if (x.style.display === "none") {
    x.style.display = "block";
  }
}

//Show Aprendizagens if a Disciplina is chosen
function showAprendizagens(DiscisplinasID, AprendizagensID) {
  let disciplina = document.getElementById(DiscisplinasID).value;
  let aprendizagem = document.getElementById(AprendizagensID);
  if (disciplina == 0){
    aprendizagem.style.display = "none";
  }
  else {
        aprendizagem.style.display = "block";
  }
}

function showlAllAprendizagens(){
    showAprendizagens ("DisciplinasDD" , "AprendizagensDD" );
    showAprendizagens ("DisciplinasDD2" , "AprendizagensDD2" );
}


function checkform ( form )
{
	var resumo = document.getElementById("Resumo").value;
	var guiao= document.getElementById("Guiao").value;
	var titulo=document.getElementById("Titulo").value;
	
	
	
	var disciplinas1= document.getElementById("DisciplinasDD").value;
	var aprendizagens1="";
	var aprendizagens1List= $('#AprendizagensDD option:selected');
	for (var i = 0; i <aprendizagens1List.length; i++) {
		aprendizagens1= aprendizagens1 + ","+ aprendizagens1List[i].text;
	}
	
	var disciplinas2= document.getElementById("DisciplinasDD2").value;
	var aprendizagens2="";
	var aprendizagens2List= $('#AprendizagensDD2 option:selected');
	for (var i = 0; i <aprendizagens2List.length; i++) {
		aprendizagens2= aprendizagens2 + ","+ aprendizagens2List[i].text;
	}

	var disciplinasAprendizagens="";
	disciplinasAprendizagens= disciplinas1 + ":" + aprendizagens1+"; "+disciplinas2+":"+aprendizagens2;
	
	
	form.action="handlenovoCIA.jsp?resumo="+resumo+"&guiao="+guiao+"&disciplinasAprendizagens="+disciplinasAprendizagens+"&titulo="+titulo;

}
