class Book < ActiveRecord::Base
  attr_accessible :autor, :description, :id_book, :id_publishing_house, :image, :string, :title
end
