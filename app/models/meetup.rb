class Meetup < ActiveRecord::Base
  belongs_to :creator, class_name: :User 
  has_many :usersmeetups
  has_many :users, through: :usersmeetups
end
