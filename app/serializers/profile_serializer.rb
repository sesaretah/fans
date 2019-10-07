class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :fullname, :bio, :number_of_friends, :avatar
  has_many :posts,  serializer: PostSerializer
  belongs_to :user
  belongs_to :wallet

  def avatar
    if object.avatar.attached?
      rails_blob_url(object.avatar, only_path: true)
    end
  end
end
