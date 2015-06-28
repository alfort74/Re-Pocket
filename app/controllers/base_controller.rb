class BaseController < ActionController::Base
	protect_from_forgery

	def login_reqired
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		else
			redirect_to root_path
		end

	end

	helper_method :current_user

	private
	def current_user
		@curren_user ||= User.find(session[:user_id]) if session[:use_id]
	end
end
