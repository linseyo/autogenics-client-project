require 'rails_helper'

describe 'nav bar' do
  feature 'nav bar links', js: true do
    it 'links to the home page' do
      visit '/'
      click_on 'Home'
      expect(page).to have_current_path root_path
    end
    xit 'links to the Log out page' do
      visit '/'
      click_on 'Log out'
      expect(page).to have_current_path users_logout_path
    end
    xit 'links to the Log in page' do
      visit '/'
      click_on 'Log in'
      expect(page).to have_current_path users_login_path
    end
    it 'links to the register page' do
      visit '/'
      click_on 'Register'
      expect(page).to have_current_path new_user_path
    end

  end
end
