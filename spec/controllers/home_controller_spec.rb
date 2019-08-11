require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "ホームページの表示" do
    it "トップページが正しく表示される" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
