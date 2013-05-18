require 'spec_helper'

feature 'User Admin page access' do

  scenario 'Anonymous user can not view user admin page' do
    visit '/'
    page.should_not have_link('User Admin')
  end

  scenario 'Non admin users can not view user admin page' do
    visit '/'
    click_link 'User Admin'
    page.should have_content('You must be an Administrator to do that')
  end

  scenario 'Admin users can see User Admin page' do
    visit '/'
    click_link 'User Admin'
    page.should have_content('User Administration Page')
  end

end

feature 'Admin User page operations' do

  scenario 'Admin users can create new user accounts' do

  end

  scenario 'Admin users can change User access permissions' do

  end

  scenario 'Admin users can delete users' do

  end

end

