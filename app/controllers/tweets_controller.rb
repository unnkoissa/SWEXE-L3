class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    logger.debug @tweets.count
  end
  
  def new
    @tweets = Tweet.new #←データを入れるためでなくformヘルパーのため
  end
  
  def create
    @tweets = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if @tweets.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end
  
  def show
    @tweets = Tweet.find(params[:id])
  end
  
  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    @tweets = Tweet.find(params[:id])
    @tweets.update(message: params[:tweet][:message])
    redirect_to root_path
  end
end

