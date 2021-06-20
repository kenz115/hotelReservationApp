class Reservation < ApplicationRecord
    blongs_to :user
    blongs_to :room
end
