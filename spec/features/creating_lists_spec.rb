require 'spec_helper'

feature 'Creating Lists' do
  scenario 'Can create a list' do
    visit '/'
    click_link 'New List'
    fill_in 'Name', with: 'Test List One'
    fill_in 'Category', with: 'Test Category'
    choose 'Active'
    choose 'Make Public'
    click_button 'Create List'
    page.should have_content('List has been created')
  end

end