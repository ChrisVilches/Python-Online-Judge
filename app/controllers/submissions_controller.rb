require 'tempfile'
require 'open3'

class SubmissionsController < ApplicationController
	helper_method :resultados_iguales?
	skip_before_filter :verify_authenticity_token

	def create

		codigo_enviado = Tempfile.new('envio')
		codigo_enviado.write(params[:codigo])
		codigo_enviado.close

		casos_prueba = Problem.find(params[:problem_id]).testcases


		@casos_totales = casos_prueba.length
		@casos_correctos = 0		
		@envio = Submission.new(problem_id: params[:problem_id])

		casos_prueba.each do |caso|

			# Crear un script bash para ejecutar con tiempo limite y memoria limite
			# Y prohibir afectar el sistema con uso de librerias (como ejecutar
			# comandos bash y borrar todo el disco duro, por ejemplo)
			stdout, stderr, status = Open3.capture3("python", codigo_enviado.path, stdin_data: caso[:input])

			if stderr.length != 0
				@envio.verdict = "Runtime error"
				break
			end

			if !resultados_iguales?(stdout, caso[:output])
				@envio.verdict = "Wrong answer"
				break
			end

			@casos_correctos += 1

		end
		

		if @casos_correctos == @casos_totales
			@envio.verdict = :Accepted	
		end
		
		@envio.save



		codigo_enviado.unlink		
	end

private
	def resultados_iguales?(res1, res2)		

		res1 = res1.squish
		res2 = res2.squish

		return res1.eql? res2
	end


end
