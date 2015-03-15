class Book < ActiveRecord::Base
 # has_attached_file :picture, :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml", :path => "/images/:filename"
  attr_accessible :author, :description, :publishing, :title, :user_id, :genre, :picture
  has_many :microposts, dependent: :destroy
  validates :title, length: { minimum: 1 }
  validates :author, length: { minimum: 1 }
  validates :publishing, length: { minimum: 1 }


end
