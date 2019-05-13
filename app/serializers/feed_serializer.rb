class FeedSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tweets
end
