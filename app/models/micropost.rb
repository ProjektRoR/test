class Micropost < ActiveRecord::Base
  belongs_to :book
  default_scope -> { order(created_at: :desc) }
  attr_accessible :content, :user_id
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
