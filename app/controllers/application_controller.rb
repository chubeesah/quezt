class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :force_json!

  def authenticate_user_from_token!
    user_token = request.headers[:HTTP_AUTH_TOKEN]
    user_token ||= params[:auth_token].presence
    user       = user_token && User.find_by_authentication_token(user_token)

    if user
      sign_in user, store: false
    else
      render json: { :error => "Authentication Failed!" },
             status: :unauthenticated
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: nil, status: :not_found
  end

  # Allows use of :create when rendering json instead of using file path of view
  def force_json!
    request.format = :json
  end
end
