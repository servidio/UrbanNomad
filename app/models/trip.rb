class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :attractions
  belongs_to :city
  has_many :comments
end
