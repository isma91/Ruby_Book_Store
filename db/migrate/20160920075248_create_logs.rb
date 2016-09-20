class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :date
      t.string :userId
      t.string :action
      t.integer :bookCustomerId
      t.timestamps
    end
  end
end
