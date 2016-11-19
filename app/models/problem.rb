class Problem < ActiveRecord::Base

	has_many :testcases, :dependent => :destroy
	has_many :submissions
	has_and_belongs_to_many :categories

	

end
