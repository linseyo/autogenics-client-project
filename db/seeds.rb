require 'faker'

Role.delete_all
User.delete_all

faculty = Role.create!(name: "Faculty")
staff = Role.create!(name: "Staff")

josh = User.create!(name: "Josh", email: "email@email.com", password: "password", role_id: faculty.id)
austin = User.create!(name: "Austin", email: "email2@email.com", password: "password", role_id: staff.id)

10.times do
Experiment.create!( title: Faker::Lorem.sentence,
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
                    author_id: josh.id,
                    staff_size: rand(1..10))
end
