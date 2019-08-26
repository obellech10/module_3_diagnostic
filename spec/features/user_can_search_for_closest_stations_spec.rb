require 'rails_helper'

# As a user
RSpec.describe 'As a user' do
  describe 'I can enter in my zip code and locate' do
    it 'the 10 closest stations within 6 miles' do
      # When I visit "/"
      visit '/'

      # And I fill in the search form with 80203 (Note: Use the existing search form)
      fill_in "Search by zip...", with: 80203
      # And I click "Locate"
      click_button 'Locate'

      # Then I should be on page "/search"
      expect(current_path).to eq('/search')

      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(page).to have_content('Stations')
      expect(page).to have_css(".station", count: 10)

      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      within(first(".station")) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.address')
        expect(page).to have_css('.fueltypes')
        expect(page).to have_css('.distance')
        expect(page).to have_css('.accesstimes')
      end
      # And the stations should be limited to Electric and Propane
      
    end
  end
end
