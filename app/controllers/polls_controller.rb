class PollsController < ApplicationController
  before_action :authenticate_user_from_token!
  
  has_attached_file :photo_post, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo_post, :content_type => /\Aimage\/.*\Z/

  def create
    @user = current_user
    @poll = @user.polls.new(poll_params)
    if @poll.save
      render :create, status: :created
    else
      render json: { :error => "Problem creating poll"}, status: :bad_request
    end
  end

  def index
    @user = current_user
    @polls = @user.polls.all
    if @polls
      render :index, status: :ok
    else
      render json: { :error => "Unable to find all polls" }, status: :not_found
    end 
  end

  def show
    @user = current_user
    @poll = @user.polls.find(params[:id])
    if @poll
      render :show, status: :ok
    else
      render json: { :error => "No poll with that id" }, status: :not_found
    end
  end

  def destroy
    @user = current_user
    @poll = @user.polls.find(params[:id])
    if @poll.destroy
     render json: { :message => "Poll successfully deleted" }, status: :ok
    else
      render json: { :error => "Poll was not deleted" }, status: :not_found
    end 
  end

  private
  
  def poll_params
    params.require(:poll).permit(:question, :photo_post, :vote_1, 
                                 :vote_2, :vote_3, :vote_4)
                                 
  end
end
