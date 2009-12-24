class Location < ActiveRecord::Base
  default_scope :order => 'name'
  validates_presence_of :name
  has_many :venues
  
end
