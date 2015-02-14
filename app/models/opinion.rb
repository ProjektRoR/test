class Opinion < ActiveRecord::Base
  attr_accessible :book_id, :opinion, :user_id
end
