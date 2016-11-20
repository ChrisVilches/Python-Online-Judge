class ProblemsController < ApplicationController
	
	def index
		@categories = Category.all

		if params[:category]			
			@problems = Problem.joins(:categories).where("categories.id = ?", params[:category]).paginate(:page => params[:page], :per_page => 15)
			
			cat_id = Integer params[:category]
			@current_category = @categories.detect{|cat| cat.id == cat_id}

		else
			@problems = Problem.paginate(:page => params[:page], :per_page => 15)
		end
	end

	def show
		@problem = Problem.find(params[:id])
		@testcases = Testcase.where(problem: @problem, public: true)
		@my_submissions = Submission.limit(10).where(problem: @problem, user: current_user).order("id DESC")

		accepted = Submission.limit(1).where(problem: @problem, user: current_user, :verdict => Submission.verdicts[:Accepted])
		@accepted = !accepted.empty? # TRUE si accepted no es vacio

	end

	
end
