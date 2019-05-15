class TweetChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    feed = Feed.find(params[:feed])
    stream_for feed
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
