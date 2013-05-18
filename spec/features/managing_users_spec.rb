require 'spec_helper'

context 'User Admin page access' do

  feature 'Anonymous user can not view user admin page' do
    visit '/'
    page.should_not have_link('User Admin')
  end

  feature 'Non admin users can not view user admin page' do
    visit '/'
    click_link 'User Admin'
    page.should have_content('You must be an Administrator to do that')
  end

  feature 'Admin users can see User Admin page' do
    visit '/'
    click_link 'User Admin'
    page.should have_content('User Administration Page')
  end

end

context 'Admin User page operations' do

  feature 'Admin users can create new user accounts' do

  end

  feature 'Admin users can change User access permissions' do

  end

  feature 'Admin users can delete users' do

  end

end

