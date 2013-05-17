require 'spec_helper'

feature 'Creating items' do
  before do
    list = Factory(:list, :name => 'Grocery')
    visit '/'
    click_link 'Grocery'
  end
  scenario 'Can create an item' do

    click_link 'Add item'
    fill_in 'Name', with: 'Cap n Crunch'
    fill_in 'Note', with: 'Test Item'
    fill_in 'Tag', with: 'test tag'

    click_button 'Create Item'
    page.should have_content('item has been created')
  end



end