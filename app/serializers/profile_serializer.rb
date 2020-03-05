class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :fullname, :bio, :number_of_friends, :avatar, :is_friend
  has_many :posts,  serializer: PostSerializer#, scope: {user_id: scope[:user_id]}
  belongs_to :user
  belongs_to :wallet


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
