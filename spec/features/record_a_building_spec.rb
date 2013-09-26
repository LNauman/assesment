require 'spec_helper'

feature 'record a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
  } do 

  # Acceptance Criteria
    # * I must specify a street address, city, state, and postal code
    # * Only US states can be specified
    # * I can optionally specify a description of the building
    # * If I enter all of the required information in the required format, 
    #   the building is recorded.
    # * If I do not specify all of the required information in the required formats, 
    #   the building is not recorded and I am presented with errors
    # * Upon successfully creating a building, 
    #   I am redirected so that I can record another building.

    scenario 'specify valid information, record is created' do
      prev_count = Building.count
      
      visit new_building_path
      fill_in 'Street address', with: '1311 South Street'
      fill_in 'City', with: 'Philadelphia'
      select 'PA', from: 'State'
      fill_in 'Postal code', with: 19147
      fill_in 'Description', with: 'Exposed brick throughout!'

      click_button 'Record'
      expect(page).to have_content('Building recorded.')
      expect(Building.count).to eql(prev_count + 1)
      # visit new_building_path
    end

    scenario 'specify invalid information, presented with errors' do 
      prev_count = Building.count

      visit new_building_path

      click_button 'Record'
      expect(page).to have_content("can't be blank")
      expect(Building.count).to eql(prev_count)
    end
end

