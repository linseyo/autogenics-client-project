require 'rails_helper'

RSpec.describe IndexController, type: :controller do
  describe 'rootpath' do
    it 'responds with status code 200' do
      get :index
      expect(response).to have_http_status 200
    end

    it 'routes to index#index' do
      expect(get: root_url).to route_to(controller: "index", action: "index")
    end
  end

  describe 'ajax rootpath' do
    context 'while user is logged in' do
      it 'renders the experiments index page' do
        xhr :index
        expect(response).to render_template("experiments/index")
      end
    end

    context 'while user is not logged in' do
      it 'renders the login form sessions_index page' do
        xhr :index
        expect(response).to render_template("sessions/index")
      end
    end
  end
end
