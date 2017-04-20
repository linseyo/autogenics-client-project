require 'rails_helper'

describe 'Experiment' do
  feature 'Experiment Index Page' do
    xit 'has a list of experiments' do
      visit "/experiments"
      expect(find('ul')).to have_selector('li')
    end

    it "has a clickable 'Post New Experiment' button" do
      visit "/experiments"
      click_on "Post New Experiment"
      expect(page).to have_current_path new_experiment_path
    end
  end
end
