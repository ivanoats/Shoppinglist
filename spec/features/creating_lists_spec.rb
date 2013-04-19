require 'spec_helper'

feature 'Creating Lists' do
  before do
    visit '/'
  end

  scenario 'can create a list' do
    click_link 'New List'
    fill_in 'Name', with: 'Test List One'

  end

end