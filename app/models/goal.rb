class Goal < ApplicationRecord
  has_many :stats, dependent: :destroy
  belongs_to :user

  validates :description, presence: true
  validates :short_desc, presence: true
  validates :target_date, presence: true
  validates :target_value, numericality: true
  validates :starting_value, numericality: true

  validate :target_value_greater_than_starting_value


  def total_progress
    stats.sum(:progress_value)
  end

  private

  def target_value_greater_than_starting_value
    return if target_value.blank? || starting_value.blank?

    if target_value <= starting_value
      errors.add(:target_value, 'must be greater than starting value')
    end
  end
end
