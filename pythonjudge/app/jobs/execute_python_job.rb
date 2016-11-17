require 'tempfile'
require 'open3'

class ExecutePythonJob
  include SuckerPunch::Job
  workers 4

  def perform(submission_id, source_code, problem_id)
    
		codigo_enviado = Tempfile.new('envio')
		codigo_enviado.write(source_code)
		codigo_enviado.close
		final_verdict = :Pending

		casos_prueba = Problem.find(problem_id).testcases

		casos_totales = casos_prueba.length
		casos_correctos = 0
		
		casos_prueba.each do |caso|			

			# Crear un script bash para ejecutar con tiempo limite y memoria limite
			# Y prohibir afectar el sistema con uso de librerias (como ejecutar
			# comandos bash y borrar todo el disco duro, por ejemplo)
			stdout, stderr, status = Open3.capture3("python", codigo_enviado.path, stdin_data: caso[:input])

			if stderr.length != 0
				final_verdict = "Runtime error"
				break
			end

			if !resultados_iguales?(stdout, caso[:output])
				final_verdict = "Wrong answer"
				break
			end

			casos_correctos += 1

		end	


		if casos_correctos == casos_totales
			final_verdict = :Accepted	
		end

		
		codigo_enviado.unlink

		ActiveRecord::Base.connection_pool.with_connection do
	      		Submission.update(submission_id, :verdict => final_verdict)
   		 end	
  end


private
	def resultados_iguales?(res1, res2)		

		res1 = res1.squish
		res2 = res2.squish

		return res1.eql? res2
	end

end
