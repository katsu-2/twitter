class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.recent.includes(:user)
    @tweet = current_user.tweets.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
        redirect_to tweets_path
    else
        render 'new'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private
    def tweet_params
        params.require(:tweet).permit(:tweet)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
