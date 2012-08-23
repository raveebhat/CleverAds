class Language < ActiveRecord::Base
  has_many :ads
  
   # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :name
  validate_uniqueness_of :name
end
