class TweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :feed_id
end
