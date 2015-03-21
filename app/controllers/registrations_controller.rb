class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, :only => [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      render :create, status: :created
    else
      render json: { messages: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end
end
