class SessionsController < Devise::SessionsController
   skip_before_action :require_no_authentication, :only => [:create]

  # Devise::PasswordsController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
      render :create, status: :ok
    else
      render json: { error: "Authentication Failed!" }, status: :unauthenticated
    end
  end

  protected
  
  def auth_hash
    request.env['omniauth.auth']
  end
end
