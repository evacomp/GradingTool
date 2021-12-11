function checkform ( form )
{
	var inputs = document.querySelectorAll('*[id^="aprendizagensCheck"]');
	var Evidencias = document.getElementById("Evidencias").value;
	var idstoPass="";
	var idsUnchecked="";
	var ids="";
	var skillsidhidden= document.getElementById("skillsidhidden").value;
	
	for(var i = 0; i < inputs.length; i++) {
		if(inputs[i].checked){
			ids =inputs[i].id.substr(18)+",";
			idstoPass= idstoPass+ids;
			//alert(idstoPass);
		}
		else {
			ids =inputs[i].id.substr(18)+",";
			idsUnchecked= idsUnchecked+ ids;
		}
	   
	}
	form.action="aprendizagematingidas.jsp?ids="+idstoPass+"&idsUnchecked="+idsUnchecked+"&Evidencias="+Evidencias+"&skillsidh="+skillsidhidden;
	
}

function selectAll () {
	var inputs = document.querySelectorAll('*[id^="aprendizagensCheck"]');
	for(var i = 0; i < inputs.length; i++) {
		inputs[i].checked=true;
	}
}
  