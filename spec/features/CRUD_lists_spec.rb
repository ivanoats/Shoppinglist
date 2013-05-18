require 'spec_helper'

feature 'CRUD Lists' do
  before(:each) do
    visit '/'
  end
  scenario 'Can create a list' do
    click_link 'New List'
    fill_in 'Name', with: 'Test List One'
    fill_in 'Category', with: 'Test Category'
    choose 'Active'
    choose 'Yes'
    click_button 'Create List'
    page.should have_content('List has been created!')
  end

  #Updating the list by adding or removing items is handled at the item level

  scenario 'Can update list attributes' do
    Factory(:list, :name => 'Test List One')
    click_link 'Test List One'
    click_link 'Test List One'
    page.should have_content('Edit List Settings')
    fill_inn 'Category', with: 'New Test Category'
    choose 'No'
    click_button 'Update List'
    page.should have_content('List Settings Updated')
    page.should have_content('New Test Category')
  end

  scenario 'Can delete a list' do
    Factory(:list, :name => 'List to Delete')
    click_link 'List to Delete'
    click_link 'List to Delete'
    click_link 'Delete this list'
    page.should have_link('New List')
    page.should_not have_content('List to Delete')
  end

end