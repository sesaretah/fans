class Transaction < ApplicationRecord
  belongs_to :sender, :class_name => 'User',:foreign_key => "sender_id"
  belongs_to :post

  after_create :affect_wallet

  def sender_profile
    self.post.user.profile
  end

  def affect_wallet
    Wallet.decrease(self.sender, 1)
  end
end
