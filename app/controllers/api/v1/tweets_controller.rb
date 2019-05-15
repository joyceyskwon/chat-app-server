class Api::V1::TweetsController < ApplicationController

  def create
    @tweet = Tweet.new(tweet_params, feed_id: 5)
    # @feed = Feed.find(tweet_params[:feed_id])
    if @tweet.save
      # @serialized_data = ActiveModelSerializers::Adapter::Json.new(TweetSerializer.new(@tweet)).serializable_hash
      # TweetChannel.broadcast_to @feed, @serialized_data
      # head :ok
      # Broadcast the fact that this happened out to all the subscribers
      ActionCable.server.broadcast("feed_channel", @tweet)
      render json: @tweet
    else
      render json: {error: 'Could not create that tweet'}, status: 422
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :feed_id)
  end 
  
end
