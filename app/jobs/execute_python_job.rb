require 'tempfile'
require 'open3'

class ExecutePythonJob
  include SuckerPunch::Job
  workers 4



  def perform(submission_id, source_code, problem_id, user_id, py_version)
    		

	    		codigo_enviado = Tempfile.new('envio')
			codigo_enviado.write(source_code)
			codigo_enviado.close
			final_verdict = :Pending	
			casos_prueba = nil

			ActiveRecord::Base.connection_pool.with_connection do
				casos_prueba = Testcase.where(problem_id: problem_id)
			end


			casos_totales = casos_prueba.length
			casos_correctos = 0

		
			casos_prueba.each do |caso|			

				# Crear un script bash para ejecutar con tiempo limite y memoria limite
				# Y prohibir afectar el sistema con uso de librerias (como ejecutar
				# comandos bash y borrar todo el disco duro, por ejemplo)
				stdout, stderr, status = Open3.capture3("python#{py_version}", codigo_enviado.path, stdin_data: caso[:input])

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

			ActiveRecord::Base.connection_pool.with_connection do
			if casos_correctos == casos_totales
				final_verdict = :Accepted
				if Submission.where({:problem_id => problem_id, :user_id => user_id, :verdict => Submission.verdicts[:Accepted]}).empty?
					Problem.find(problem_id).increment!(:users_solved) 
				end
			end					
		
	      		Submission.update(submission_id, :verdict => final_verdict)

	   		 end	

	   		 codigo_enviado.unlink
   		 
  end


private
	def resultados_iguales?(res1, res2)		

		res1 = res1.squish
		res2 = res2.squish

		return res1.eql? res2
	end

end
