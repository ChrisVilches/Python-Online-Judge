var code_editor = null;
var rails_data = {};
var template = null;
var polling_attempts = 5;

function initialize_code_editor(){

	if(!$("#source_code").length) return;

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

function get_and_render_submissions(){

	if(!template)
		 template = Handlebars.compile($("#submissions_table").html());

	$.ajax({
		url: "/problems/" + rails_data.problem_id + "/submissions", 
		dataType: "json"
	})
	.done(function(res){
		if(just_sent = res.find(sub => sub.id == rails_data.submission_id))
			just_sent.highlight = true;

		var render = template({ submissions: res });
		$("#latest_submissions").html(render);

		$("time.timeago").timeago();

		if(res.find(sub => sub.verdict == "Pending")){ // Polling
			polling_attempts--;
			if(polling_attempts > 0)
				setTimeout(get_and_render_submissions, 3000);
			else
				console.log("Demasiados polling")
		}
	});
}


function save_code(){
	localStorage.setItem("submission_" + rails_data.problem_id, JSON.stringify({
		problem_id: rails_data.problem_id,
		python_version: $("input[name=python_version]:checked").val(),
		source_code: code_editor.getValue()
	}));
}

function load_code(){
	old_code = localStorage.getItem("submission_" + rails_data.problem_id);
	if(old_code != null){
		old_code = JSON.parse(old_code);
		$("input[name=python_version][value=" + old_code.python_version + "]").attr('checked', 'checked');
		code_editor.setValue(old_code.source_code);
	}
}


function submit_code_handler(e){

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

}


function initialize_submission_form(data){	
	rails_data = data;	
	initialize_code_editor();
	$("#submit_code").on("click", submit_code_handler);

	if(rails_data.user_signed){
		get_and_render_submissions();
		load_code();
	}	
}

