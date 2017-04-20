require 'rails_helper'

describe 'Experiment' do
  feature 'Experiment Index Page', js: true do
    it 'has a list of experiments' do
      faculty = Role.create!(name: "Faculty")
      josh = User.create!(name: "Josh", email: "email@email.com", password: "password", role_id: faculty.id)
       exp = Experiment.create!( title: Faker::Lorem.sentence,
                    abstract: Faker::Lorem.paragraph,
                    introduction: Faker::Lorem.paragraph,
                    materials: Faker::Lorem.paragraph,
                    results: Faker::Lorem.paragraph,
                    discussion: Faker::Lorem.paragraph,
                    conclusion: Faker::Lorem.paragraph,
                    supporting_info: Faker::Lorem.paragraph,
                    acknowledgments: Faker::Lorem.paragraph,
                    references: Faker::Lorem.paragraph,
                    author_contributions: Faker::Lorem.paragraph,
                    author_id: josh.id)
      visit "/experiments"
      expect(find('ul')).to have_selector('li.title')
    end

    xit "has a clickable 'Post New Experiment' button" do
      faculty = Role.create!(name: "Faculty")
      linsey = User.create!(name: "Josh", email: "email@email.com", password: "password", role_id: faculty.id)
      new_exp = Experiment.create!( title: Faker::Lorem.sentence,
                    abstract: Faker::Lorem.paragraph,
                    introduction: Faker::Lorem.paragraph,
                    materials: Faker::Lorem.paragraph,
                    results: Faker::Lorem.paragraph,
                    discussion: Faker::Lorem.paragraph,
                    conclusion: Faker::Lorem.paragraph,
                    supporting_info: Faker::Lorem.paragraph,
                    acknowledgments: Faker::Lorem.paragraph,
                    references: Faker::Lorem.paragraph,
                    author_contributions: Faker::Lorem.paragraph,
                    author_id: linsey.id)

      visit "/experiments"
      click_on "Post New Experiment"
      expect(page).to have_current_path new_experiment_path
    end
  end
end
