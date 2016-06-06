require 'rails_helper'

RSpec.describe "search by zipcode", type: :feature do
  scenario "user searches for stations by zipcode" do
    visit '/'

    within("form-group search-field") do
      expect(page).to have_content("Search by zip...")
    end

    within("form-control") do
      fill_in "Search by zip...", with: "80203"
      click_button("Locate")
    end

    expect(page).to have_current_path "/search?zip=80203"
    expect(page).to have_content("Stations within 6 miles sorted by distance")
    expect(page).to have_content("Electric and Propane")
    within("table-headers") do
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Types")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
    end

    #   Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    #   And the stations should be limited to Electric and Propane
    #   And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

  end
end
