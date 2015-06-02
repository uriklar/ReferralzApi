class ApplicationController < ActionController::API
	include ActionController::MimeResponds
	#include ActionController::RequestForgeryProtection
	include DeviseTokenAuth::Concerns::SetUserByToken
	#protect_from_forgery with: :null_session
	#before_filter :authenticate_user!
end
