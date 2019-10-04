class CreateBargains < ActiveRecord::Migration[5.2]
  def change
    create_table :bargains do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :amount

      t.timestamps
    end
  end
end
