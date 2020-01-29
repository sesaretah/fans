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

  def is_friend(profile)
    self.user.is_friend(profile.user)
  end

  def friends_profiles
    profiles = []
    for user in Friendship.friends(self.user)
      if user.profile
        profiles << user.profile
      end
    end
    return profiles
  end
end
