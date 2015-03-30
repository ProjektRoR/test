class Opinion < ActiveRecord::Base
  belongs_to :book
  attr_accessible :content, :user_id
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
