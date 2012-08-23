class Adv < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  belongs_to :session
  
  #accepts_nested_attributes_for :advs_categories

  has_attached_file :photo 
  
  validates_presence_of :title, :desturl,  :bodytext, :language_id
  validates_uniqueness_of :title, :message => "Already exists"
  
  attr_accessible :title, :language_id, :desturl, :verified, :bodytext, :user_id, :id, :photo
  
end
