class Submission < ActiveRecord::Base
	enum verdict: [ "Wrong answer", "Time limit", "Memory limit", "Runtime error", "Compile error", "Accepted"]
	belongs_to :problem
	validates_presence_of :verdict
	validates_presence_of :problem

end
