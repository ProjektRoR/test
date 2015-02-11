class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :mail
      t.string :password
      t.string :account_type
      t.string :favourite

      t.timestamps
    end
  end
end
