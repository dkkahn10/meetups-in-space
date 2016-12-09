require 'spec_helper'


feature "User interacts with meetups" do

  scenario "Homepage lists meetups in alphabetical order" do
    party = FactoryGirl.create(:meetup, name: "Bagels")
    awesome = FactoryGirl.create(:meetup, name: "Apps Cool")
    superb = FactoryGirl.create(:meetup, name: "Zebras")

    visit '/'

    expect(page).to have_content("1. Apps Cool")
    expect(page).to have_content("2. Bagels")
    expect(page).to have_content("3. Zebras")
  end

  scenario "user views the details of a meetup to learn more about its purpose" do
    party = FactoryGirl.create(:meetup, name: "PartyPandas")

    visit '/'
    click_link "PartyPandas"

    expect(page).to have_content(party.name)
    expect(page).to have_content(party.description)
    expect(page).to have_content(party.location)
    expect(page).to have_content(party.creator)
  end

  scenario "user views the details of a meetup to learn more about its purpose" do
    party = FactoryGirl.create(:meetup, name: "PartyPandas")
    user = FactoryGirl.create(:user)

    visit '/'
    sign_in_as user
    click_link "Create a New Meetup"

    expect(page).to have_css("form")
  end
end
