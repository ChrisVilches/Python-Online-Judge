class SubmissionsController < ApplicationController
	before_action :authenticate_user!
	protect_from_forgery

	def index

		if params[:problem_id]

			@latest_submissions = Submission.limit(10).where(problem_id: params[:problem_id], user: current_user).order("id DESC")
			
			respond_to do |format|						
				format.html { redirect_to problem_path(params[:problem_id]) }
				format.json { render json: @latest_submissions }
			end

		else
			@submissions = Submission.where(user: current_user).order("id desc").paginate(:page => params[:page], :per_page => 15)
		end
	end

	def create

		problem_id = Integer params[:problem_id]
		py_version = Integer params[:python_version]
		wait_time = 10

		latest_submission_by_user = Submission.where(user: current_user).last
		time_difference = (DateTime.now.to_time - latest_submission_by_user.created_at.to_time).to_i

		if(time_difference < wait_time)
			redirect_to problem_path(problem_id), alert: "Espere #{wait_time - time_difference} segundos antes de enviar otro codigo. Relaja la raja."
			return
		end

		

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
