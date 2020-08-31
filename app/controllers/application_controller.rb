class ApplicationController < ActionController::API
    include ActionController::Helpers
    before_action :logged_in?
    helper_method :current_user, :user_signed_in?, :current_user

    def encode_token(payload)
        JWT.encode(payload, "fitzbud", "HS256")
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if user_signed_in?
    end
     
    
    def authenticate_user
        redirect_to new_session_path, alert: 'Please sign in' unless user_signed_in?
    end
    
    def user_signed_in?
        session[:user_id].present?
    end
      
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if user_signed_in?
    end
      

end
