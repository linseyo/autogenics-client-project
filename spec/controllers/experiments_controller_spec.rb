require 'rails_helper'

describe ExperimentsController do
  let!(:faculty) { Role.create!(name: "Faculty") }
  let!(:josh) { User.create!(name: "Josh", email: "email@email.com", password: "password", role_id: faculty.id) }
  let!(:experiment) { Experiment.create!( title: Faker::Lorem.sentence,
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
                    author_id: josh.id) }

  describe 'GET #show' do
    it 'responds with a status code 200' do
      get :show, { id: exp.id }
      expect(response). to have_http_status 200
    end
  end
  describe "GET #new" do
    before(:each) do
      get :new
    end

    it 'responds with a status code 200' do
      expect(response.status).to eq 200
    end

    it 'renders the :new template for an experiment' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    before(:each) do
     post :create,  experiment: exp
   end

   it 'responds with a status code of 202' do
    expect(response.status).to eq 202
  end
  end
end
