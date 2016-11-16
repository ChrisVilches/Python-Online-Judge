json.array! @casos do |caso|
	json.extract! caso, :entrada, :salida
end