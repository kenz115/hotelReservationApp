require 'rails_helper'

RSpec.describe User, type: :model do
  describe "存在、重複の確認" do
  
    it "ユーザー名、メールアドレス、パスワードがあれば有効な状態であること" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
      
    it "ユーザー名がなければ無効な状態であること" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
      
    it "メールアドレスがなければ無効な状態であること" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
      
    it "パスワードがなければ無効な状態であること" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
      
    it "メールアドレスが重複しているなら無効な状態であること" do
      FactoryBot.create(:user, email: "uniquness@test.com")
      schedule = FactoryBot.build(:user, email: "uniquness@test.com")
      schedule.valid?
      expect(schedule.errors[:email]).to include("はすでに存在します")
    end  
  end

  describe "文字数制限の確認" do
        
    it "ユーザー名が21文字以上なら無効な状態であること" do
      @user = FactoryBot.build(:user, :over_characters)
      @user.valid?
      expect(@user.errors[:name]).to include("は20文字以内で入力してください")
    end
        
  end
end
