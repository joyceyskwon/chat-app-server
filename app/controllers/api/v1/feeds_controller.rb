class Api::V1::FeedsController < ApplicationController

  def index
    @feeds = Feed.all 
    render json: @feeds
  end 

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      @serialized_data = ActionModelSerializers::Adapter::Json.new(FeedSerializer.new(@feed)).serializable_hash
      ActionCable.server.broadcast 'feed_channel', @serialized_data
      head :ok
    else
      render json: {error: 'Could not create feed'}, status: 422
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:name)
  end 
  
end
