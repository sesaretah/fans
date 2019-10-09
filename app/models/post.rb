class Post < ApplicationRecord
  has_one_attached :image
  has_one_attached :thumb
  has_one_attached :blured_image
  has_one_attached :video
  has_one_attached :blured_video
  belongs_to :user
  has_many :transactions

  def profile
    self.user.profile
  end

end
