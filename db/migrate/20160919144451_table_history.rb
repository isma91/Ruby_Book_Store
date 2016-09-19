class TableHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.datetime :date
      t.string :user
      t.string :action
    end
  end
end
