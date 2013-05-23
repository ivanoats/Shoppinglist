require 'spec_helper'

feature 'CRUD Lists' do
  before(:each) do
    Factory(:list, :name => 'Grocery')
    visit '/'
  end

  scenario 'Can create a list' do
    find('.nav').click_link 'New List'
    fill_in 'Name', with: 'Test List One'
    fill_in 'Category', with: 'Test Category'
    choose 'Active'
    choose 'Yes'
    click_button 'Create List'
    page.should have_content('List has been created!')
  end

  #Updating the list by adding or removing items is handled at the item level


  scenario 'Can update list attributes' do
    click_link 'Grocery'
    click_link 'Grocery'
    page.should have_content('Edit List Settings')
    fill_in 'Category', with: 'New Test Category'
    choose('No')
    click_button 'Update List'
    page.should have_content('List has been updated')
    page.should have_content('Grocery')
    click_link 'Grocery'
    page.has_checked_field?(id = 'No').should == true
  end

  scenario 'Can delete a list' do
    click_link 'Grocery'
    click_link 'Grocery'
    click_link 'Delete this list'
    page.should have_link('New List')
    page.should_not have_content('Grocery')
  end

end