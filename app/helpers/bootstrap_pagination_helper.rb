# https://thehungrycoder.com/ruby-on-rails/will-paginate-links-and-twitter-bootstrap.html

module BootstrapPaginationHelper
	class LinkRenderer < WillPaginate::ActionView::LinkRenderer
		protected

		def page_number(page)
			unless page == current_page
				btn(page, page, { :rel => rel_value(page) })
			else
				btn(page, :active)
			end
		end

		def gap
			btn("&hellip;", :disabled)
		end

		def next_page
			if @collection.current_page < @collection.total_pages
				btn("<i class='glyphicon glyphicon-chevron-right'></i>", @collection.current_page + 1)
			else
				btn("<i class='glyphicon glyphicon-chevron-right'></i>", :disabled)
			end
		end

		def previous_page
			if @collection.current_page > 1
				btn("<i class='glyphicon glyphicon-chevron-left'></i>", @collection.current_page - 1)
			else
				btn("<i class='glyphicon glyphicon-chevron-left'></i>", :disabled)
			end
		end

		def html_container(html)
			content = tag(:div, tag(:div, html), container_attributes)

			tag(:div, content, class: "text-center")
			
		end

		private

		def btn(text, target, attributes = {})

			if target.is_a? Fixnum
				attributes[:rel] = rel_value(target)
				target = url(target)
				attributes[:href] = target
			end

			attributes[:class] = "btn btn-pagination"			

			case target
				when :disabled 
					attributes[:disabled] = :disabled;
				when :active 
					attributes[:class] += " btn-pagination-active"
			end

			tag(:a, text, attributes)
		end

	end
end

