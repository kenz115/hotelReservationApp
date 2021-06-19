class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    validates :name, presence: true, length: {maximum: 20}
    validates :introduction, presence: true, length: {maximum: 100}
    validates :address, presence: true, length: {maximum: 30}
    validates :introduction,  length: {maximum: 50}
    validates :fee,  presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :image, presence: true, content_type: { in: %w[image/jpeg image/gif image/png],
                                                    message: "must be a valid image format" },
                                                    size: { less_than: 5.megabytes,
                                                    message: "should be less than 5MB" }
    validates :user_id, presence: true
end
