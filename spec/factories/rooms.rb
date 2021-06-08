FactoryBot.define do
  factory :room do
    name { "テストルーム" }
    address { "千葉県市川市北方１−１−１" }
    introduction { "テストテストテストテストテスト" }
    fee { 30000 }
    image { "test.jpg" }
  end
end
