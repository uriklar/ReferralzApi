class ApplicationController < ActionController::API
	include ActionController::MimeResponds
	include DeviseTokenAuth::Concerns::SetUserByToken
	before_action :configure_permitted_parameters, if: :devise_controller?
	#before_filter :authenticate_user!

	def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :invitation_code
  end
end
