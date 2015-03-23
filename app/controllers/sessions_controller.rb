class SessionsController < Devise::SessionsController
   skip_before_action :require_no_authentication, :only => [:create]

  # Devise::PasswordsController
  def create
    @user = warden.authenticate(auth_options)
    if self.current_user = @user
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
