class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :lastname
      t.string :firstname
      t.string :adresse
      t.string :city
      t.string :email
      t.timestamps
    end
  end
end
