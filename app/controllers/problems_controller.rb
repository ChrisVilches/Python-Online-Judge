class ProblemsController < ApplicationController
	before_action :authenticate_user!

	def index
		@categories = Category.all

		if params[:category]			
			@problems = Problem.joins(:categories).where("categories.id = ?", params[:category]).paginate(:page => params[:page], :per_page => 2)
			
			cat_id = Integer params[:category]
			@current_category = @categories.detect{|cat| cat.id == cat_id}

		else
			@problems = Problem.paginate(:page => params[:page], :per_page => 2)
		end
	end

	def show
		@problem = Problem.find(params[:id])
		@testcases = Testcase.where(problem_id: params[:id], public: true)
		@my_submissions = Submission.limit(10).where(problem_id: params[:id], user: current_user).order("id DESC")
	end

	
end
