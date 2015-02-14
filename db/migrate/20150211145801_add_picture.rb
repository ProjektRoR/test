class AddPicture < ActiveRecord::Migration
  def change
    add_column :books, :picture, :binary
  end
end
