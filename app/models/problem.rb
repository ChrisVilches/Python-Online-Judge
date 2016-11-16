class Problem < ActiveRecord::Base

	has_many :casos, :dependent => :destroy
	has_many :envios

	

end
