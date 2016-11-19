class SubmissionsController < ApplicationController

	def show
		@submission = Submission.find(params[:id])
	end


	def create

		problem_id = params[:problem_id]

		# Crea un envio preliminar con veredicto Pending
		@submission = Submission.new(problem_id: problem_id, verdict: :Pending)

		if @submission.save
			# Al envio se le modifica el veredicto aqui:
			ExecutePythonJob.perform_async(@submission.id, params[:source_code], problem_id)
			redirect_to problem_path(problem_id, :submission_id => @submission.id), notice: "Codigo guardado exitosamente"
		else
			redirect_to problem_path(problem_id), notice: "Hubo un error al enviar el programa"
		end

	end

end
