require 'rails_helper'


describe 'show registration form', js: true do
  it 'visits the new user page, enters information, and submits the form' do
    visit '/users/new'

    fill_in "Full Name", with: "Matt Fischer"
    fill_in "Email", with: "matthew.gfischer@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Access Token", with: "xNa23adsf"


  end
end
