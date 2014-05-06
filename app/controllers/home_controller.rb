class HomeController < ApplicationController

	 #before_filter :authenticate,    :only => :index
	

	def show

	end

	def index
		@title = "Dashboard" if signed_in?			
		if signed_in?
			@micropost = Micropost.new
			@feed_items = current_user.feed.paginate(:page => params[:page])
		end
	end




  private

    def authenticate
      deny_login_page unless !signed_in?          
    end


end
