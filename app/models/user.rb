class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates_format_of :mobile, :with => ^\+[1-9]{1}[0-9]{3,14}$, :on => :create
  validates :username, uniqueness: true

  has_one :profile
  has_one :wallet
  has_many :posts
  has_many :pleadings

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def is_friend(user)
    flag = false
    for friend in Friendship.friends(self)
      flag = true if friend.id == user.id
    end
    return flag
  end
end
