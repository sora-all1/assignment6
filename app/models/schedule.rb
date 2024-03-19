# app/models/schedule.rb

class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true, on_or_after: { start_date: :start_date }
end
