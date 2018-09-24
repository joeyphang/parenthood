class ApplicationController < ActionController::Base
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user

	# def require_valid_user!
	# 	if current_user.nil?
	# 		flash[:error] = 'Please Sign In.'
	# 		redirect_to signin_path
	# 	end
	# end

end
