class SessionsController < ApplicationController
  
  #before_filter :deny_signin_page,    :only => [:new, :create]


  def new
    @title = "Sign in"  

  end

  def create
  	user = User.authenticate(params[:session][:email],
  							 params[:session][:password])

  	if user.nil?
  		flash.now[:error] = "invalid email/password combination."
  		@title = "Sign in"
  		render 'new'
  	else
  		sign_in user
  		redirect_back_or user
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end



  private



end
