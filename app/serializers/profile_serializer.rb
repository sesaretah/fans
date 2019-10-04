class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :bio, :number_of_friends
  has_many :posts,  serializer: PostSerializer
  belongs_to :user
  belongs_to :wallet
end
