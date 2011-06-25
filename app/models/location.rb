require "informal"
class Location < ActiveRecord::Base
  include Informal::Model
  default_scope :order => 'locations.name'
  validates_presence_of :name
  has_many :venues
  
end
