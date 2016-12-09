require 'spec_helper'

feature 'user fills out forms' do
  let(:name) { "Come on and meet Kyle" }
  let(:location) { "Launch Academy" }
  let(:description) { "Meet Kyle and learn about all of his embarrassing history" }

  scenario 'if user is not signed in, throw error' do
    visit '/'
    visit '/meetups/new'

    expect(page).to have_content("Error! Please sign in!")
  end

  scenario 'tests for filled out name' do
    user = FactoryGirl.create(:user)

    visit '/'
    sign_in_as user
    visit '/meetups/new'
    fill_in "name", with: name
    fill_in "location", with: location
    fill_in "description", with: description
    click_button "Submit"

    expect(page).to have_content(title)
    expect(page).to have_content(location)
    expect(page).to have_content(description)
    expect(page).to have_css('a[href="Home"]')
  end

  context "invalid form submission" do

    scenario 'tests for filled out name' do
      user = FactoryGirl.create(:user)

      visit '/meetups/new'
      sign_in_as user
      fill_in "location", with: location
      fill_in "description", with: description
      click_button "Submit"

      expect(page).to have_content("Please fill out all forms...Or else 🍟")
    end
  end


end
