class SubmissionsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		if params.has_key? :problem_id
			@submissions = Submission.where(problem_id: params[:problem_id])
		else
			@submissions = Submission.all
		end
	end


	def create

		# Crea un envio preliminar con veredicto Pending
		@envio = Submission.new(problem_id: params[:problem_id], verdict: :Pending)
		@envio.save		
		
		# Al envio se le modifica el veredicto aqui:
		ExecutePythonJob.perform_async(@envio.id, params[:codigo], params[:problem_id])

	end




end
