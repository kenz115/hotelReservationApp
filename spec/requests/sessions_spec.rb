require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "ログイン画面を正常にレスポンスすること" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

end
