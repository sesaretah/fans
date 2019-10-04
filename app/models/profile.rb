class Profile < ApplicationRecord
  has_one_attached :avatar
  belongs_to :user

  def number_of_friends
    Friendship.number_of_friends(self.user)
  end



  def posts
    self.user.posts
  end

  def wallet
    self.user.wallet.amount rescue 0
  end
end
