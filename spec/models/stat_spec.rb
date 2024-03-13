require 'rails_helper'

RSpec.describe Stat, type: :model do
  before :each do
    @goal = Goal.create!(
      description: 'Read more books', 
      short_desc: 'Reading', 
      target_date: Date.today + 30, 
      target_value: 10, 
      starting_value: 0,
      user: User.create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')
    )
  end

  it 'is valid with valid attributes' do
    stat = @goal.stats.build(recorded_date: Date.today, progress_value: 5)
    expect(stat).to be_valid
  end

  it 'is not valid without a recorded_date' do
    stat = @goal.stats.build(progress_value: 5)
    expect(stat).not_to be_valid
    expect(stat.errors.messages[:recorded_date]).to include("can't be blank")
  end

  it 'is not valid without a progress_value' do
    stat = @goal.stats.build(recorded_date: Date.today)
    expect(stat).not_to be_valid
    expect(stat.errors.messages[:progress_value]).to include("can't be blank")
  end
end
