class FixCreatorInMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :creator_id, :integer, null: false
    remove_column :meetups, :creator, :string, null: false
  end
end
