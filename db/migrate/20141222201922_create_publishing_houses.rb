class CreatePublishingHouses < ActiveRecord::Migration
  def change
    create_table :publishing_houses do |t|
      t.integer :id_book
      t.string :name_publishing

      t.timestamps
    end
  end
end
