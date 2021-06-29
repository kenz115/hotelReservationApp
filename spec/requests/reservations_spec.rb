require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  describe "GET /index" do

    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
    end

    it "予約済み一覧画面が正常にレスポンスを返すこと" do
      get "/reservations/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    before do
      @user = FactoryBot.create(:user)
      @room = FactoryBot.create(:room)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
    end

    it "予約済み詳細画面が正常にレスポンスを返すこと" do
      reservation = FactoryBot.create(:reservation)
      get "/reservations", params: {id: reservation.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do

    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
      @room = FactoryBot.create(:room)
      @reservation_params = FactoryBot.attributes_for(:reservation)
    end

    it "予約画面が正常にレスポンスを返すこと" do
      get "/reservations/new", params: {start_date: "3021-07-01", end_date: "3021-07-10", number_of_peaple: 1, room_id: 1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    before do
      @user = FactoryBot.create(:user)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: @user.id)
      @room = FactoryBot.create(:room)
      @reservation_params = FactoryBot.attributes_for(:reservation)
    end

    it "予約内容を登録すること" do
      expect {
        post "/reservations", params: {reservation: @reservation_params}
      }.to change(Reservation, :count).by(1)
    end

    it "予約詳細画面に遷移すること" do
      post "/reservations", params: {reservation: @reservation_params}
      expect(response).to redirect_to "/reservations/1"
    end
  end

end
