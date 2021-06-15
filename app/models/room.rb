class Room < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, length: {maximum: 20}
    validates :address, presence: true, length: {maximum: 30}
    validates :introduction,  length: {maximum: 50}
    validates :fee,  presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :image, presence: true
end
