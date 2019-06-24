class TweetsController < ApplicationController
  def index
    @tweets = Tweet.recent
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
        redirect_to tweets_path
    else
        render 'new'
    end
  end

  private
    def tweet_params
        params.require(:tweet).permit(:tweet)
    end
end
