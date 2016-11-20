class Submission < ActiveRecord::Base
	# Pending debe ser 0 siempre
	enum verdict: ["Pending", "Wrong answer", "Time limit", "Memory limit", "Runtime error", "Compile error", "Accepted"]
	belongs_to :problem
	belongs_to :user
	validates_presence_of :verdict
	validates_presence_of :problem
	validates_presence_of :user

	validates :py_version,
    		:inclusion  => { :in => [ 2, 3 ] }

end
