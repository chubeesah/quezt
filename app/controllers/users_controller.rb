class UsersController < ApplicationController

   def show
    @user = User.find(params[:id])
    if @user
      render :show, status: :ok
    else
      render json: { :error => "No user with that id" }, status: :not_found
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.update(user_params)
      render :edit, status: :accepted
    else
      render json: { :error => "Unable to edit user."}, status: :bad_request
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      render json: { :message => "User successfully deleted" }, status: :ok
    else
      render json: { :error => "User was not deleted" }, status: :not_found
    end  
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :avatar, :password)
  end
end
