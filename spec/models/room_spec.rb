require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "存在の確認" do

    it "ルーム名、紹介、金額、住所、画像があれば有効な状態であること" do
      FactoryBot.create(:user)
      room = FactoryBot.build(:room)
      expect(room).to be_valid
    end
      
    it "ルーム名がなければ無効な状態であること" do
      room = FactoryBot.build(:room, name: nil)
      room.valid?
      expect(room.errors[:name]).to include("を入力してください")
    end
      
    it "部屋紹介がなければ無効な状態であること" do
      room = FactoryBot.build(:room, introduction: nil)
      room.valid?
      expect(room.errors[:introduction]).to include("を入力してください")
    end
      
    it "金額がなければ無効な状態であること" do
      room = FactoryBot.build(:room, fee: nil)
      room.valid?
      expect(room.errors[:fee]).to include("を入力してください")
    end

    it "住所がなければ無効な状態であること" do
      room = FactoryBot.build(:room, address: nil)
      room.valid?
      expect(room.errors[:address]).to include("を入力してください")
    end

    it "画像がなければ無効な状態であること" do
      room = FactoryBot.build(:room, image: nil)
      room.valid?
      expect(room.errors[:image]).to include("を入力してください")
    end
      
  end

  describe "文字数制限の確認" do

    before do
      @room = FactoryBot.build(:room, :over_characters)
    end
        
    it "ユーザー名が21文字以上なら無効な状態であること" do
      @room.valid?
      expect(@room.errors[:name]).to include("は20文字以内で入力してください")
    end

    it "住所が31文字以上なら無効な状態であること" do
      @room.valid?
      expect(@room.errors[:address]).to include("は30文字以内で入力してください")
    end

    it "部屋紹介が51文字以上なら無効な状態であること" do
      @room.valid?
      expect(@room.errors[:introduction]).to include("は50文字以内で入力してください")
    end   
  end
end
