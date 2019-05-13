class TweetSerializer < ActiveModel::Serializer
  attributes :id, :feed_id, :content, :created_at
end
