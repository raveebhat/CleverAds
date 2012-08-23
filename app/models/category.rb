class Category < ActiveRecord::Base
  has_and_belongs_to_many :advs  
  
  attr_accessible :name
  #accepts_nested_attributes :advs_categories, :advs

end