class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :post_id
      t.integer :sender_id

      t.timestamps
    end
  end
end
