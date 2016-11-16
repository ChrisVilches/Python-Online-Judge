require 'tempfile'
require 'open3'

class EnvioController < ApplicationController
	helper_method :resultados_iguales?

	def index

		if params[:problem_id] != nil
			@problema = Problem.find(params[:problem_id])
			@casos_ejemplo = Caso.where(problem_id: params[:problem_id], publico: true)


		else
			puts "NO HAY PROBLEMA +++++++++++++++++++++++"
		end

		@ultimos_envios = Envio.all.order("id DESC")

		puts "CUANTOS++++++++++++++++++++++++++"
		puts @ultimos_envios.length

	end

	def resultados_iguales?(res1, res2)		

		res1 = res1.squish
		res2 = res2.squish

		return res1.eql? res2
	end


	def juzgar

		codigo_enviado = Tempfile.new('envio')
		codigo_enviado.write(params[:codigo])
		codigo_enviado.close

		casos_prueba = Problem.find(params[:problem_id]).casos

		@casos_totales = casos_prueba.length
		@casos_correctos = 0

		casos_prueba.each do |caso|

			stdout, stderr, status = Open3.capture3("python", codigo_enviado.path, stdin_data: caso[:entrada])

			if stderr.length != 0
				@error_codigo = true
				@error_trace = stderr
				break
			end

			if !resultados_iguales?(stdout, caso[:salida])
				break
			end

			@casos_correctos += 1

		end


		envio = Envio.new

		if @casos_correctos == @casos_totales
			envio.verdict = :Accepted
		else
			envio.verdict = "Runtime error"
		end
		envio.problem_id = params[:problem_id]
		envio.save



		codigo_enviado.unlink
	end
end
