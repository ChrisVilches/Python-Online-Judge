json.array! @problems do |problem|
	json.id problem.id
	json.title problem.title
	json.statement problem.statement	
end