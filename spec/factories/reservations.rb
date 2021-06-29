FactoryBot.define do
  factory :reservation do
    start_date { "3021-06-20 20:17:47" }
    end_date { "3021-06-21 20:17:47" }
    number_of_peaple { 1 }
    room_id { 1 }
    user_id { 1 }
  end
end
