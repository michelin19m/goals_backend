class Goal < ApplicationRecord
  has_many :stats, dependent: :destroy
  belongs_to :user

  validates :description, presence: true
  validates :short_desc, presence: true
  validates :target_date, presence: true
  validates :target_value, presence: true
  validates :starting_value, presence: true

  def total_progress
    stats.sum(:progress_value)
  end
end
