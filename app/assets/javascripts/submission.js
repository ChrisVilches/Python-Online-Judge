var code_editor = null;
var problem_id = null;

$(document).on('turbolinks:load', function(){

	if($("#source_code").length != 0){

		code_editor = CodeMirror.fromTextArea(document.getElementById("source_code"), {
			mode: {
				name: "python",
				version: 3,
				singleLineStringErrors: false
			},
			lineNumbers: true,
			indentUnit: 4,
			matchBrackets: true,
			theme: 'oceanic'
		});
	}

	load_code();


	// Form submit handler
	$("#submit_code").on("click", function(e){

		e.preventDefault();

		// Validations
		if($("#submit_code").attr("disabled")) return;
		if(code_editor.getValue().trim().length == 0) return;
				
		// Avoid sending data multiple times
		$( "#submit_code" ).attr("disabled", true);
		$( "#submit_code" ).val("Espere...");

		// Saves form
		save_code();

		$("#submit_code_form").submit();
		
	});
});


function save_code(){
	localStorage.setItem("submission_" + problem_id, JSON.stringify({
		problem_id: problem_id,
		python_version: $("input[name=python_version]:checked").val(),
		source_code: code_editor.getValue()
	}));
}

function load_code(){
	old_code = localStorage.getItem("submission_" + problem_id);
	if(old_code != null){
		old_code = JSON.parse(old_code);
		$("input[name=python_version][value=" + old_code.python_version + "]").attr('checked', 'checked');
		code_editor.setValue(old_code.source_code);
	}
}


function init(id){
	problem_id = id;
}


function reload_pending_submission(resource_url, submission_id){

	var pending = $("td[pending="+submission_id+"]");	
	if(pending.length == 0) return;
	
	var times = 0;
	var id = pending.attr("pending");

	var interval = setInterval(function(){
		$.ajax({
			type: "GET",
			url: resource_url + "/" + id,
			success: function(res){
				if(res.verdict != 0){
					clearInterval(interval);
					pending.html(res.verdict_name);
				}
			},
			error: function(){
				clearInterval(interval);
			}
		});
		times++;
		if(times == 5){
			clearInterval(interval);
		}
	}, 3000);
}
