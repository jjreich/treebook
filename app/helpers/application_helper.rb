module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			puts "alert-danger"
		when :notice
			puts "alert-info"
		else
			puts ""
		end
	end
end
