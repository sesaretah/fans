class Friendship < ApplicationRecord

  def self.number_of_friends(user)
    Friendship.where('status = 1 AND (friend_id = ? OR user_id = ?)', user.id, user.id).count
  end

  def self.friend_ids(user)
    Friendship.where('status = 1 AND (friend_id = ? OR user_id = ?)', user.id, user.id).pluck(:id).uniq
  end
end
