class Friendship < ApplicationRecord

  def self.number_of_friends(user)
    Friendship.bidirect(user).count
  end

  def self.friend_ids(user)
    result = []
    for friendship in Friendship.bidirect(user)
      result << friendship.user_id if friendship.user_id != user.id
      result << friendship.friend_id if friendship.friend_id != user.id
    end
    return result.uniq
  end

  def self.friends(user)
    users = []
    for user_id in Friendship.friend_ids(user)
      users << User.find(user_id) rescue nil
    end
    return users
  end

  def self.bidirect(user)
    Friendship.where('status = 1 AND (friend_id = ? OR user_id = ?)', user.id, user.id)
  end
end
