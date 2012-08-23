class User < ActiveRecord::Base
  has_many :sessions
  has_many :ads
  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :email, :password, :password_confirmation, :remamber_me, :name 
  
  




end
