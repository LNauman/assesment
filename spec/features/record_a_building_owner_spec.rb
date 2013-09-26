require 'spec_helper'

feature 'record a building owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners  
} do

  # Acceptance Criteria
  # * I must specify a first name, last name, and email address
  # * I can optionally specify a company name
  # * If I do not specify the required information, I am presented with errors
  # * If I specify the required information, 
  #   the owner is recorded and I am redirected to enter another new owner 

  scenario 'specifies valid information' do
    prev_count = Owner.count
      
    visit new_owner_path
    fill_in 'First name', with: 'Bob'
    fill_in 'Last name', with: 'Sagget'
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Company', with: 'Chuckie Cheese'


    click_button 'Record'
    expect(page).to have_content('Owner recorded.')
    expect(Owner.count).to eql(prev_count + 1)
  end

  scenario 'specifies invalid information' do
    prev_count = Owner.count

    visit new_owner_path
    click_button 'Record'

    expect(page).to have_content("can't be blank")
      expect(Owner.count).to eql(prev_count)
  end
end
