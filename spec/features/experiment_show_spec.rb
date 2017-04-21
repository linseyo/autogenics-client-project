require 'rails_helper'

describe 'Experiment' do
  feature 'Experiment Show Page' do
    it 'displays an experiments title' do
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
      visit "/experiments/#{exp.id}"
      expect(page).to have_content "#{exp.title}"
    end

    xit 'displays the sign-up button, redirects back to the experiment show page and shows the users name at the bottom of the staff list' do
      faculty = Role.create!(name: "Faculty")
      john = User.create!(name: "John", email: "email@email.com", password: "password", role_id: faculty.id)
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
                    author_id: john.id)

      visit "/experiments/#{new_exp.id}"
      click_on "Sign Up For Experiment"
      expect(page).to have_current_path experiment_path
    end


  end
end
