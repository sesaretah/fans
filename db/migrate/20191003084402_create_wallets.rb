class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
  end
end
