class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :date
      t.string :user_id
      t.string :action
      t.integer :book_id, :default => nil
      t.integer :customer_id, :default => nil
      t.integer :order_id, :default => nil
      t.timestamps
    end
  end
end
