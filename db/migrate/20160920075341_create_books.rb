class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :editor
      t.string :year
      t.string :kind
      t.string :cover
      t.string :resume
      t.timestamps
    end
  end
end
