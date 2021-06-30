FactoryBot.define do
  factory :reservation do
    start_date { "3021-06-20 20:17:47" }
    end_date { "3021-06-21 20:17:47" }
    number_of_peaple { 1 }
    room_id { 1 }
    user_id { 1 }

    trait :error_date do
      start_date { "2021-5-21" }
      end_date { "2021-5-20" }
    end
  end
end
