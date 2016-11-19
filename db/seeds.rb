# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
	{:id => 1, :email =>"felovilches@gmail.com", :encrypted_password => "$2a$11$JIZAhTE1G5zCc.PEY4f3uuBdgKO50cQ2NuBbhngpqkZPqJ6W/LKVS", :created_at => "2016-11-19 09:52:16.411324", :updated_at => "2016-11-19 09:52:16.844787"},
	{:id => 2, :email =>"patocespedes@gmail.com", :encrypted_password => "$2a$11$JIZAhTE1G5zCc.PEY4f3uuBdgKO50cQ2NuBbhngpqkZPqJ6W/LKVS", :created_at => "2016-11-19 09:52:16.411324", :updated_at => "2016-11-19 09:52:16.844787"},
	{:id => 3, :email =>"lilicespedes@gmail.com", :encrypted_password => "$2a$11$JIZAhTE1G5zCc.PEY4f3uuBdgKO50cQ2NuBbhngpqkZPqJ6W/LKVS", :created_at => "2016-11-19 09:52:16.411324", :updated_at => "2016-11-19 09:52:16.844787"}
	])

cat1 = Category.create({:id => 1, :name => "Listas", :description => "Trabajar con arreglos, listas, recorrerlos, etc"})
cat2 = Category.create({:id => 2, :name => "Arithmetic", :description => "Hacer operaciones aritmeticas"})
cat3 = Category.create({:id => 3, :name => "Strings", :description => "Hacer operaciones con strings. Cortar strings, invertir, etc"})
cat4 = Category.create({:id => 4, :name => "Matrices", :description => "Realizar operaciones en matrices, como obtener su traza, determinante, etc"})


problems = Problem.create([
	{id: 1, title: "Sumando numeros", statement: "Dados dos numeros a y b, sumalos.", :categories => [cat1, cat2]},
	{id: 2, title: "Cual es mayor", statement: "Dados dos numeros a y b, muestra por pantalla el mayor.", :categories => [cat2, cat3]},
	{id: 3, title: "Multiplicando numeros", statement: "Multiplicar numeros a y b", :categories => [cat1, cat4]}
	])

testcases = Testcase.create([

	{id: 1, input: "1 1 1", output: "3", public: true, problem_id: 1},
	{id: 2, input: "2 2 2", output: "6", public: true, problem_id: 1},
	{id: 3, input: "3 3 3", output: "9", public: false, problem_id: 1},
	{id: 4, input: "4 4 4", output: "12", public: false, problem_id: 1},

	{id: 5, input: "1 2", output: "2", public: true, problem_id: 2},
	{id: 6, input: "3 2", output: "3", public: true, problem_id: 2},
	{id: 7, input: "3 9", output: "9", public: false, problem_id: 2},
	{id: 8, input: "12 4", output: "12", public: false, problem_id: 2},

	{id: 9, input: "10 2", output: "20", public: true, problem_id: 3},
	{id: 10, input: "3 20", output: "60", public: true, problem_id: 3},
	{id: 11, input: "12 2", output: "24", public: false, problem_id: 3},
	{id: 12, input: "5 4", output: "20", public: false, problem_id: 3}

	])
