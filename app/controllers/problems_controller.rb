class ProblemsController < ApplicationController

	def index
		@problems = Problem.all
	end

	def show
		@problem = Problem.find(params[:id])
		@testcases = Testcase.where(problem_id: params[:id], public: true)
		@my_submissions = Submission.limit(10).where(problem_id: params[:id]).order("id DESC")
	end

	
end
