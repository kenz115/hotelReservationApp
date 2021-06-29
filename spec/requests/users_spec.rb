require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /sign_up" do
    it "ユーザー登録画面が正常にレスポンスを返すこと" do
      get "/users/sign_up"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    before do
      @user_params = FactoryBot.attributes_for(:user)
    end

    it "ユーザーを登録すること" do
      expect {
        post "/users", params: {user: @user_params}
      }.to change(User, :count).by(1)
    end

    it "ホーム画面に遷移すること" do
      post "/users", params: {user: @user_params}
      expect(response).to redirect_to "/"
    end
  end

  describe "GET /account" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
    end

    it "アカウント画面が正常にレスポンスを返すこと" do
      get "/users/account"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
    end

    it "編集画面が正常にレスポンスを返すこと" do
      get "/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /profile" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
    end

    it "プロフィール画面が正常にレスポンスを返すこと" do
      get "/users/profile"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /profile" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
      @user_params = FactoryBot.attributes_for(:user, :edit_user)
    end

    it "アカウント情報を編集すること" do
      patch "/users/update", params: {user: @user_params}
      expect(@user.reload.email).to eq("edited@test.com")
    end

    it "ホーム画面に遷移すること" do
      patch "/users/update", params: {user: @user_params}
      expect(response).to redirect_to "/"
    end
  end

  describe "PATCH /profile" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
      @user_params = FactoryBot.attributes_for(:user, :edit_user_profile)
    end

    it "プロフィールを編集すること" do
      patch "/users/profile", params: {user: @user_params}
      expect(@user.reload.name).to eq("編集後テストユーザー")
    end

    it "プロフィール画面に遷移すること" do
      patch "/users/profile", params: {user: @user_params}
      expect(response).to redirect_to "/users/profile"
    end
  end

  describe "GET /sign_in" do
    it "ログイン画面が正常にレスポンスを返すこと" do
      get "/users/sign_in"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sign_out" do
    before do
      @user = FactoryBot.create(:user)
    end

    it "ホーム覧画面に遷移すること" do
      delete "/sign_out"
      expect(response).to redirect_to "/"
    end
  end
end
