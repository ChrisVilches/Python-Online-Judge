var code_editor = null;

$(document).on('turbolinks:load', function(){

	if(code_editor == null && $("#source_code").length != 0){

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
});


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
