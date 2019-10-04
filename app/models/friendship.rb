class Friendship < ApplicationRecord

  def self.number_of_friends(user)
    Friendship.where('status = 1 AND (friend_id = ? OR user_id = ?)', user.id, user.id).count
  end

  def self.friend_ids(user)
    friendships = Friendship.where('status = 1 AND (friend_id = ? OR user_id = ?)', user.id, user.id)
    result = []
    for friendship in friendships
      result << friendship.user_id if friendship.user_id != user.id
      result << friendship.friend_id if friendship.friend_id != user.id
    end
    return result.uniq
  end
end
