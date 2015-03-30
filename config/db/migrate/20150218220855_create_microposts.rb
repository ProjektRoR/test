class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :book
      t.integer :user_id

      t.timestamps
    end
    add_index :microposts, :book_id
  end
end
