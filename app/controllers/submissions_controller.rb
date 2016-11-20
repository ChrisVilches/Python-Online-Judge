class SubmissionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@submissions = Submission.where(user: current_user).order("id desc").paginate(:page => params[:page], :per_page => 15)
	end

	def show
		@submission = Submission.find(params[:id])
	end


	def create

		Rails.logger.level = 5 # at any time	

		problem_id = Integer params[:problem_id]
		py_version = Integer params[:python_version]

		# Crea un envio preliminar con veredicto Pending
		@submission = Submission.new(problem_id: problem_id, verdict: :Pending, user: current_user, py_version: py_version)

		Problem.find(problem_id).increment!(:total_submissions)		

		if @submission.save
			# Al envio se le modifica el veredicto aqui:
			ExecutePythonJob.perform_async(@submission.id, params[:source_code], problem_id, current_user.id, py_version)
			redirect_to problem_path(problem_id, :submission_id => @submission.id)
		else
			redirect_to problem_path(problem_id), alert: "Hubo un error al enviar el programa"
		end

	end

end
