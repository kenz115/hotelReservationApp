require 'rails_helper'

RSpec.describe Reservation, type: :model do
    describe "存在の確認" do
        it "開始日、終了日、人数があれば有効な状態であること" do
            FactoryBot.create(:user)
            FactoryBot.create(:room)
            reservation = FactoryBot.build(:reservation)
            expect(reservation).to be_valid
        end
        
        it "開始日がなければ無効な状態であること" do
            reservation = FactoryBot.build(:reservation, start_date: nil, end_date: nil)
            reservation.valid?
            expect(reservation.errors[:start_date]).to include("を入力してください")
        end
        
        it "終了日がなければ無効な状態であること" do
            reservation = FactoryBot.build(:reservation, end_date: nil)
            reservation.valid?
            expect(reservation.errors[:end_date]).to include("を入力してください")
        end
        
        it "人数がなければ無効な状態であること" do
            reservation = FactoryBot.build(:reservation, number_of_peaple: nil)
            reservation.valid?
            expect(reservation.errors[:number_of_peaple]).to include("を入力してください")
        end
    end

    describe "無効な日付が入力されていないかの確認" do
        before do
          @reservation = FactoryBot.build(:reservation, :error_date)
        end
    
        it "開始日が過去の日付なら無効な状態であること" do
          @reservation.valid?
          expect(@reservation.errors[:start_date]).to include("は本日以降の日付を入力して下さい")
        end
    
        it "終了日が開始日より過去の日付なら無効な状態であること" do
          @reservation.valid?
          expect(@reservation.errors[:end_date]).to include("は開始日以降の日付を入力してください")
        end
    end
end
