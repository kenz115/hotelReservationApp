class User < ApplicationRecord
    has_many :room, dependent: :destroy
end
