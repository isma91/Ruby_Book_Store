class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :email
      t.string :pass
      t.timestamps
    end
  end
end
