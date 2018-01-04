class SessionsController < ApplicationController
	include SessionsHelper
	def new
		if logged_in?
			redirect_to "/users/#{current_user.id}"
		else
			@user = User.new
		end
	end

	def create
		@user = User.find_by(email: session_params[:email])
		if @user && @user.authenticate(session_params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			@user = User.new
			@user.valid?
			render 'new'
		end
	end

	def destroy
		if logged_in?
			session.delete(:user_id)
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	private

		def session_params
			params.require(:session).permit(:email, :password)
		end
end