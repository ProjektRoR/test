class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.string :adres
      t.integer :pojemnosc

      t.timestamps
    end
  end
end
