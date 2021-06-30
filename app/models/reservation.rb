class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :number_of_peaple,  presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validate :start_date_after_today
    validate :end_date_after_start_date

    def start_date_after_today
        errors.add(:start_date, 'は本日以降の日付を入力して下さい') if start_date != nil && start_date < Date.today
    end
    
    def end_date_after_start_date
        errors.add(:end_date, 'は開始日以降の日付を入力してください') if end_date != nil && end_date < start_date
    end
end
