class Session < ActiveRecord::Base
  belongs_to :user
  has_many :ads
  validates :provider, :uid, :presence => true
end
