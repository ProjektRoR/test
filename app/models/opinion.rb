class Opinion < ActiveRecord::Base
  attr_accessible :id_book, :id_user, :number, :text
end
