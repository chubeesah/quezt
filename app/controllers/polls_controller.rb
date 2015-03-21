class PollsController < ApplicationController
  before_action :authenticate_user_from_token!

  def create
    
  end

  def show
    
  end

  def destroy
    
  end

  private
  
  def poll_params
    params.require(:poll).permit(:question, :vote_1, :vote_2, 
                                 :vote_2, :vote_3, :vote_4)
  end
end
