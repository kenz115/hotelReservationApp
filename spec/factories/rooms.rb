FactoryBot.define do
  factory :room do
    name { "テストルーム" }
    address { "千葉県市川市北方１−１−１" }
    introduction { "テストテストテストテストテスト" }
    fee { 30000 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/room01.jpeg'), 'image/png') }
    user_id { 1 }
  end
end
