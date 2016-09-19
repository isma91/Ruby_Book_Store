class TableOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :type
      t.string :idCustomer
      t.integer :idBook
      t.integer :pass
      t.timestamps
    end
  end
end
