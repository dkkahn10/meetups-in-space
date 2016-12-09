class Meetups < ActiveRecord::Migration
  def change
    create_table :meetups do |meetup|
      meetup.string :name, null: false
      meetup.string :description, null: false
      meetup.string :location, null: false
      meetup.string :creator, null: false

      meetup.timestamps null: false
    end

    # add_index :users, [:uid, :provider], unique: true
  end
end
