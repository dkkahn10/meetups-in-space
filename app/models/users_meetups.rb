class UsersMeetups < ActiveRecord::Base
  belongs_to :users
  belongs_to :meetups
end
