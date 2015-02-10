class User < ActiveRecord::Base
  attr_accessible :account_type, :favourite, :mail, :name, :password, :surname
end
