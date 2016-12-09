class UserMeetups < ActiveRecord::Migration
  def change
    create_table :usersmeetups do |meetups|
      meetups.integer :meetup_id, null: false
      meetups.integer :user_id, null: false

      meetups.timestamps null: false 
    end
  end

end
