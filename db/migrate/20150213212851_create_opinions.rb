class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :book_id
      t.integer :user_id
      t.text :opinion

      t.timestamps
    end
  end
end
