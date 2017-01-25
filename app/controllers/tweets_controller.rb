class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tweets
  def index
    @tweet = Tweet.new
    @tweets = Tweet.order("datetime(created_at) DESC").all
    @users = User.all
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path, notice: 'Rweet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tweets/1
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweets_path, notice: 'Rweet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Rweet was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end