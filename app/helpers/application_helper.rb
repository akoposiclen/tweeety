module ApplicationHelper

	def title
		base_title = "Tweety"
		if @title.nil?
			base_title
		else
			"#{@title}"
		end
	end

end
