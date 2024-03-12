class Stat < ApplicationRecord
  belongs_to :goal

  validates :recorded_date, presence: true
  validates :progress_value, presence: true
end
