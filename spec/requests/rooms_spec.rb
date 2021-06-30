require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "GET /" do
    it "ルーム一覧画面が正常にレスポンスを返すこと" do
      get "/rooms/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "ルーム一覧画面が正常にレスポンスを返すこと" do
      get "/rooms/search"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /posts" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
    end

    it "投稿済みルーム一覧画面が正常にレスポンスを返すこと" do
      get "/rooms/posts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
    end

    it "ルーム詳細画面が正常にレスポンスを返すこと" do
      room = FactoryBot.create(:room)
      get "/rooms", params: {id: room.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "ルーム登録画面が正常にレスポンスを返すこと" do
      get "/rooms/new"
      expect(response).to have_http_status(:success)
    end
  end
    
  describe "POST /create" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)  
      @room_params = FactoryBot.attributes_for(:room)
    end
    
    it "ルームを登録すること" do
      expect {
        post "/rooms", params: {room: @room_params}
      }.to change(Room, :count).by(1)
    end
    
    it "ホーム画面に遷移すること" do
      post "/rooms", params: {room: @room_params}
      expect(response).to redirect_to "/rooms/1"
    end
  end
end
