class MicropostsController < ApplicationController

	before_filter :authenticate
	before_filter :authorized_user, :only => :destroy

	#def create

	#	@micropost = current_user.microposts.build(params[:micropost])
	#	if @micropost.save
	#		redirect_to current_user
	#	else		
	#		@feed_items = current_user.feed.paginate(:page => params[:page])	
	#		redirect_to current_user, :flash => { :success => "Content can't be blank" }
	#	end
	#end


	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			redirect_to (:back), :flash => { :success => "Post created" }
		else
			@feed_items = current_user.feed.paginate(:page => params[:page])	
			render 'home/index'	
		end
		
	end

	def destroy
		@micropost.destroy
		redirect_to (:back), :flash => { :success => "Post Deleted" }
	end


	private
		def authorized_user
			@micropost = Micropost.find(params[:id])
			redirect_to root_path unless current_user?(@micropost.user)
		end

end