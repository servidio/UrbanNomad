class Attraction < ActiveRecord::Base
  belongs_to :trip
  has_one :city, :through => :trip
end
