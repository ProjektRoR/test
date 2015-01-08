class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :id_book
      t.integer :id_user
      t.string :text
      t.decimal :number

      t.timestamps
    end
  end
end
