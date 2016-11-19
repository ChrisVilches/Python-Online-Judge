class Problem < ActiveRecord::Base

	has_many :testcases, :dependent => :destroy
	has_many :submissions

	

end
