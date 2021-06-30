FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test@test.com" }
    password { "password" }
    password_confirmation { "password" }

    trait :edit_user do
      email { "edited@test.com" }
      password { "editedpassword" }
      password_confirmation { "editedpassword" }
      current_password { "password" }
      introduction { "自己紹介テスト" }
    end

    trait :edit_user_profile do
      name { "編集後テストユーザー" }
      introduction { "自己紹介テスト" }
    end

    trait :over_characters do
      name { "testtesttesttesttestt" }
    end
  end
end
