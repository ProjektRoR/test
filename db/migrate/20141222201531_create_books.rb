class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :id_book
      t.string :title
      t.string :autor
      t.integer :id_publishing_house
      t.string :image
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
