class Wallet < ApplicationRecord
  belongs_to :user

  def self.decrease(user, i)
    @wallet = Wallet.where(user_id: user.id).first
    if @wallet.blank?
      @wallet = Wallet.create(user_id: user.id)
    end
    @wallet.amount = @wallet.amount.to_i - i
    @wallet.save
  end
end
