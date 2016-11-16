json.array! @problems do |problem|
	json.name problem.title
	json.enunciado problem.enunciado	
end