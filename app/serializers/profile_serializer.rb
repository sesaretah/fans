class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :fullname, :bio, :number_of_friends, :avatar, :is_friend, :posts
  #has_many :posts,  serializer: PostSerializer
  belongs_to :user
  belongs_to :wallet

  def posts
    result = []
    for post in object.posts
      result << PostSerializer.new(post).as_json
    end
    return result
  end

  def is_friend
    if scope && scope[:user_id]
      user = User.find(scope[:user_id])
      return user.is_friend(object.user)
    end
  end

  def avatar
    if object.avatar.attached?
      rails_blob_url(object.avatar, only_path: true)
    end
  end
end
