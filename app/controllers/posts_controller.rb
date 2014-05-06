class PostsController < ApplicationController
	

	#had views
	def index
		@posts = Post.all
	end

	#had views
	def show
		@post = Post.find(params[:id])
	end
	#had views
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])

		if @post.save		
			redirect_to posts_path, :notice => "Your post was saved"
		else
			render "new"
		end
	end
	#had views
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post  = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to posts_path, :notice => "Your post has been updated"
		else
			render "edit"
		end
	end

	#def destroy
	#	@post = Post.find(params[:id])
	#	@post.destroy
	#	redirect_to posts_path, :notice => "Deleted"
	#end

end
