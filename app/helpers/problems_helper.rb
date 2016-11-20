module ProblemsHelper
	def add_attr(attr, value)
		" #{attr}=\"#{ value }\"".html_safe
	end
end
