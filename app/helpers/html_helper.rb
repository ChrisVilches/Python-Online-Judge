module HtmlHelper
	def page_header(title)
		"<legend><h1>#{title}</h1></legend>".html_safe
	end
end
