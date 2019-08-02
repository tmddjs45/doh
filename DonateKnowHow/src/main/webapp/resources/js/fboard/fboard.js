$(function(){
	function getParameterByName(name){
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
			results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	function paintBtn(){
		var pageNum = getParameterByName('pageNum');
		var textArray = document.querySelectorAll('.btn'); 
		for(var i = 0; i<textArray.length; i++){
			if(pageNum == textArray[i].textContent){
				textArray[i].style.color = "red";
				textArray[i].style.fontSize = "22px";
				textArray[i].style.fontWeight = "900";
			}
		}
	}
	
	function StorageSelected(){
		var select = getParameterByName('select');
		var optionArray = document.querySelectorAll('option');
		for(var i=0; i<optionArray.length; i++){
			if(select == optionArray[i].value){
				optionArray[i].selected = "selected";
			}
		}
	}
	function titleLinkSelected() {
		var f_no = getParameterByName('f_no');
		var bnoArray = document.querySelectorAll('.bno'); 
		for(var i = 0; i<bnoArray.length; i++){
			if(f_no == bnoArray[i].textContent){
				bnoArray[i].style.color = "red";
				bnoArray[i].style.fontWeight = "bold";
				bnoArray[i].style.fontSize = "18px";
			}
		}
	}

	
	function init(){
		paintBtn();
		StorageSelected();
		titleLinkSelected();
	}

	init();
});