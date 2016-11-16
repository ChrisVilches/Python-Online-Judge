class TestcasesController < ApplicationController
  def index
  	@casos = Testcase.where(problem_id: params[:problem_id], public: true)
  end
end
