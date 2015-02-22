class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.text :content
      t.references :book
      t.integer :user_id

      t.timestamps
    end
    add_index :opinions, :book_id
  end
end
