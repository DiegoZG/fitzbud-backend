class Api::V1::BaseController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if user_signed_in?
    end
    helper_method :current_user
  
    private
  
    def authenticate
      api_key = params[:api_key] || request.headers['Authorization']
      @api_user = User.find_by_api_key params [:api_key]
      head :unauthorized unless @api_user
    end
end
