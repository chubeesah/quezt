class PollsController < ApplicationController
  before_action :authenticate_user_from_token!

  def create
    @user = current_user
    @poll = @user.polls.new(poll_params)
    if @poll.save
      render :create, status: :created
    else
      render json: { :error => "Problem creating poll"}, status: :bad_request
    end
  end

  def vote1
    @poll = Poll.find(params[:id])
    if @poll
      @poll.vote_for_1(@poll)
      render :vote, status: :ok
    else
      render json: { :error => @poll.errors.full_messages }, status: :bad_request
    end
  end

  def vote2
    @poll = Poll.find(params[:id])
    if @poll
      @poll.vote_for_2(@poll)
      @poll.update(poll_params)
      render :vote, status: :ok
    else
      render json: { :error => @poll.errors.full_messages }, status: :bad_request
    end
  end

  def vote3
    @poll = Poll.find(params[:id])
    if @poll
      @poll.vote_for_3(@poll)
      @poll.update(poll_params)
      render :vote, status: :ok
    else
      render json: { :error => @poll.errors.full_messages }, status: :bad_request
    end
  end

  def vote4
    @poll = Poll.find(params[:id])
    if @poll
      @poll.vote_for_4(@poll)
      @poll.update(poll_params)
      render :vote, status: :ok
    else
      render json: { :error => @poll.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @polls = Poll.all
    @radius = @polls.near([params[:latitude], params[:longitude]], 50)
    if @radius
      render :index
    else
      render json: { :error => @poll.errors.full_messages }, status: :not_found
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

  def nearby_polls
    @polls = Poll.all
    @radius = @polls.near([params[:latitude], params[:longitude]], 50)
    if @radius
      render :nearby_polls
    else
      render json: { :error => @poll.errors.full_messages }, status: :not_found
    end
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end
  
  def poll_params
    params.require(:poll).permit(:username, :question, :photo_post, :answer_1, 
                                 :answer_2, :answer_3, :answer_4, :vote_1, 
                                 :vote_2, :vote_3, :vote_4, :latitude, :longitude)                            
  end
end
