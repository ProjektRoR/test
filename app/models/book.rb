class Book < ActiveRecord::Base
  attr_accessible :author, :description, :publishing, :title, :user_id, :genre, :picture
  has_many :microposts, dependent: :destroy


end
