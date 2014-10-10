class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :pages
      t.decimal :price
      t.string :urlCover

      t.timestamps
    end
  end
end
