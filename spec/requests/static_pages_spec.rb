require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "正常にホーム画面を返すこと" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
