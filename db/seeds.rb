# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


problems = Problem.create([
	{id: 1, title: "Sumando numeros", enunciado: "Dados dos numeros a y b, sumalos."},
	{id: 2, title: "Cual es mayor", enunciado: "Dados dos numeros a y b, muestra por pantalla el mayor."},
	{id: 3, title: "Multiplicando numeros", enunciado: "Multiplicar numeros a y b"}
	])

casos = Caso.create([

	{id: 1, entrada: "1 1 1", salida: "3", publico: true, problem_id: 1},
	{id: 2, entrada: "2 2 2", salida: "6", publico: true, problem_id: 1},
	{id: 3, entrada: "3 3 3", salida: "9", publico: false, problem_id: 1},
	{id: 4, entrada: "4 4 4", salida: "12", publico: false, problem_id: 1},

	{id: 5, entrada: "1 2", salida: "2", publico: true, problem_id: 2},
	{id: 6, entrada: "3 2", salida: "3", publico: true, problem_id: 2},
	{id: 7, entrada: "3 9", salida: "9", publico: false, problem_id: 2},
	{id: 8, entrada: "12 4", salida: "12", publico: false, problem_id: 2},

	{id: 9, entrada: "10 2", salida: "20", publico: true, problem_id: 3},
	{id: 10, entrada: "3 20", salida: "60", publico: true, problem_id: 3},
	{id: 11, entrada: "12 2", salida: "24", publico: false, problem_id: 3},
	{id: 12, entrada: "5 4", salida: "20", publico: false, problem_id: 3}

	])
