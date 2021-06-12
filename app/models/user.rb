class User < ApplicationRecord
    has_many :room, dependent: :destroy
    has_secure_password
end
